//
//  ChannelManagerConstructor.swift
//  LDKSwiftARC
//
//  Created by Arik Sosman on 5/19/21.
//

import Foundation

enum InvalidSerializedDataError: Error {
    case invalidSerializedChannelMonitor
    case invalidSerializedChannelManager
}

public class ChannelManagerConstructor {

    public let channelManager: ChannelManager
    
    /**
     * The latest block has the channel manager saw. If this is non-null it is a 32-byte block hash.
     * You should sync the blockchain starting with the block that builds on this block.
     */
    public let channel_manager_latest_block_hash: [UInt8]?
    
    let logger: Logger
    fileprivate var customPersister: CustomChannelManagerPersister?
    fileprivate var customEventHandler: CustomEventHandler?
    public let peerManager: PeerManager
    
    /**
     * A list of ChannelMonitors and the last block they each saw. You should sync the blockchain on each individually
     * starting with the block that builds on the hash given.
     * After doing so (and syncing the blockchain on the channel manager as well), you should call chain_sync_completed()
     * and then continue to normal application operation.
     */
    public private(set) var channel_monitors: [(ChannelMonitor, [UInt8])]

    private let chain_monitor: ChainMonitor

    public init(channel_manager_serialized: [UInt8], channel_monitors_serialized: [[UInt8]], keys_interface: KeysInterface, fee_estimator: FeeEstimator, chain_monitor: ChainMonitor, filter: Filter?, router: NetGraphMsgHandler?, tx_broadcaster: BroadcasterInterface, logger: Logger) throws {

        var monitors: [LDKChannelMonitor] = []
        self.channel_monitors = []
        for currentSerializedChannelMonitor in channel_monitors_serialized {
            let res: Result_C2Tuple_BlockHashChannelMonitorZDecodeErrorZ = UtilMethods.constructor_BlockHashChannelMonitorZ_read(ser: currentSerializedChannelMonitor, arg: keys_interface)
            if res.cOpaqueStruct?.result_ok != true {
                throw InvalidSerializedDataError.invalidSerializedChannelMonitor
            }
            let value: LDKCResult_C2Tuple_BlockHashChannelMonitorZDecodeErrorZPtr = res.cOpaqueStruct!.contents
            let a: LDKThirtyTwoBytes = value.result!.pointee.a
            var b: LDKChannelMonitor = value.result!.pointee.b
            b.is_owned = false
            let currentChannelMonitor = ChannelMonitor(pointer: b)
            var clonedChannelMonitor = currentChannelMonitor.clone(orig: currentChannelMonitor)
            clonedChannelMonitor.cOpaqueStruct?.is_owned = false
            monitors.append(clonedChannelMonitor.cOpaqueStruct!)
            self.channel_monitors.append((clonedChannelMonitor, Bindings.LDKThirtyTwoBytes_to_array(nativeType: a)))
        }

        let res = UtilMethods.constructor_BlockHashChannelManagerZ_read(ser: channel_manager_serialized, arg_keys_manager: keys_interface, arg_fee_estimator: fee_estimator, arg_chain_monitor: chain_monitor.as_Watch(), arg_tx_broadcaster: tx_broadcaster, arg_logger: logger, arg_default_config: UserConfig(), arg_channel_monitors: monitors)
        if res.cOpaqueStruct?.result_ok != true {
            throw InvalidSerializedDataError.invalidSerializedChannelManager
        }
        let latestBlockHash = Bindings.LDKThirtyTwoBytes_to_array(nativeType: res.cOpaqueStruct!.contents.result.pointee.a)
        let channelManager = ChannelManager(pointer: res.cOpaqueStruct!.contents.result.pointee.b)

        self.channelManager = channelManager
        self.channel_manager_latest_block_hash = latestBlockHash
        self.chain_monitor = chain_monitor
        self.logger = logger
        
        let random_data = keys_interface.get_secure_random_bytes();
        if let router = router {
            let messageHandler = MessageHandler(chan_handler_arg: channelManager.as_ChannelMessageHandler(), route_handler_arg: router.as_RoutingMessageHandler())
            self.peerManager = PeerManager(message_handler: messageHandler, our_node_secret: keys_interface.get_node_secret(), ephemeral_random_data: random_data, logger: self.logger)
        } else {
            let messageHandler = MessageHandler(chan_handler_arg: channelManager.as_ChannelMessageHandler(), route_handler_arg: IgnoringMessageHandler().as_RoutingMessageHandler())
            self.peerManager = PeerManager(message_handler: messageHandler, our_node_secret: keys_interface.get_node_secret(), ephemeral_random_data: random_data, logger: self.logger)
        }

        if let filter = filter {
            for (currentMonitor, _) in self.channel_monitors {
                currentMonitor.load_outputs_to_watch(filter: filter)
            }
        }

    }

    /**
     * Constructs a channel manager from the given interface implementations
     */
    public init(network: LDKNetwork, config: UserConfig, current_blockchain_tip_hash: [UInt8], current_blockchain_tip_height: UInt32, keys_interface: KeysInterface, fee_estimator: FeeEstimator, chain_monitor: ChainMonitor, router: NetGraphMsgHandler?, tx_broadcaster: BroadcasterInterface, logger: Logger) {
        self.channel_monitors = []
        self.channel_manager_latest_block_hash = nil
        self.chain_monitor = chain_monitor
        let block = BestBlock(block_hash: current_blockchain_tip_hash, height: current_blockchain_tip_height)
        let chainParameters = ChainParameters(network_arg: network, best_block_arg: block)
        self.channelManager = ChannelManager(fee_est: fee_estimator, chain_monitor: chain_monitor.as_Watch(), tx_broadcaster: tx_broadcaster, logger: logger, keys_manager: keys_interface, config: config, params: chainParameters)
        self.logger = logger
        
        let random_data = keys_interface.get_secure_random_bytes();
        if let router = router {
            let messageHandler = MessageHandler(chan_handler_arg: channelManager.as_ChannelMessageHandler(), route_handler_arg: router.as_RoutingMessageHandler())
            self.peerManager = PeerManager(message_handler: messageHandler, our_node_secret: keys_interface.get_node_secret(), ephemeral_random_data: random_data, logger: self.logger)
        } else {
            let messageHandler = MessageHandler(chan_handler_arg: channelManager.as_ChannelMessageHandler(), route_handler_arg: IgnoringMessageHandler().as_RoutingMessageHandler())
            self.peerManager = PeerManager(message_handler: messageHandler, our_node_secret: keys_interface.get_node_secret(), ephemeral_random_data: random_data, logger: self.logger)
        }
    }
    
    var persisterWorkItem: DispatchWorkItem?
    var backgroundProcessor: BackgroundProcessor?
    var shutdown = false
    
    /**
     * Utility which adds all of the deserialized ChannelMonitors to the chain watch so that further updates from the
     * ChannelManager are processed as normal.
     *
     * This also spawns a background thread which will call the appropriate methods on the provided
     * ChannelManagerPersister as required.
     */
    public func chain_sync_completed(persister: ExtendedChannelManagerPersister) {
        
        if self.backgroundProcessor != nil {
            return
        }
        
        for (currentChannelMonitor, _) in self.channel_monitors {
            let chainMonitorWatch = self.chain_monitor.as_Watch()
            let monitorClone = currentChannelMonitor.clone(orig: currentChannelMonitor)
            let fundingTxo = monitorClone.get_funding_txo()
            let outPoint = OutPoint(pointer: fundingTxo.cOpaqueStruct!.a)
            
            let monitorWatchResult = chainMonitorWatch.watch_channel(funding_txo: outPoint, monitor: monitorClone)
            if !monitorWatchResult.isOk() {
                print("Some error occurred with a chainMonitorWatch.watch_channel call")
            }
        }
        
        self.customPersister = CustomChannelManagerPersister(handler: persister)
        self.customEventHandler = CustomEventHandler(handler: persister)
        self.backgroundProcessor = BackgroundProcessor(persister: self.customPersister!, event_handler: self.customEventHandler!, chain_monitor: self.chain_monitor, channel_manager: self.channelManager, peer_manager: self.peerManager, logger: self.logger)
        
        
    }
    
    public func interrupt() {
        self.shutdown = true
        self.backgroundProcessor?.stop()
    }

}

fileprivate class CustomChannelManagerPersister: ChannelManagerPersister {
    
    let handler: ExtendedChannelManagerPersister
    
    init(handler: ExtendedChannelManagerPersister) {
        self.handler = handler
        super.init()
    }
    
    override func persist_manager(channel_manager: ChannelManager) -> Result_NoneErrorZ {
        return self.handler.persist_manager(channel_manager: channel_manager)
    }
}

fileprivate class CustomEventHandler: EventHandler {

    let handler: ExtendedChannelManagerPersister
    
    init(handler: ExtendedChannelManagerPersister) {
        self.handler = handler
        super.init()
    }
    
    override func handle_event(event: Event) {
        self.handler.handle_event(event: event)
    }
    
    
}

public protocol ExtendedChannelManagerPersister: ChannelManagerPersister {
    func handle_event(event: Event) -> Void;
}
