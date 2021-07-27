//
//  TCPPeerHandler.swift
//  LDKSwiftARC
//
//  Created by Arik Sosman on 7/8/21.
//

import Foundation

public class TCPPeerHandler {
    
    private let peerManager: PeerManager
    private let socketHandler: UnsafeMutableRawPointer?
    private var isBound = false
    
    public init(peerManager: PeerManager) {
        self.peerManager = peerManager
        let socketHandler = withUnsafePointer(to: self.peerManager.cOpaqueStruct!) { (pointer: UnsafePointer<LDKPeerManager>) -> UnsafeMutableRawPointer? in
            let socketHandler = init_socket_handling(pointer)
            return socketHandler
        }
        self.socketHandler = socketHandler
        print("TCPPeerHandler self address: \(Unmanaged<TCPPeerHandler>.passUnretained(self).toOpaque())")
    }
    
    public func bind(address: String, port: UInt16) -> Bool {
        if(self.isBound){
            // already bound
            return false
        }
        self.isBound = true
        var addressObject = sockaddr_in()
        addressObject.sin_len = UInt8(MemoryLayout.size(ofValue: addressObject))
        addressObject.sin_family = sa_family_t(AF_INET)
        addressObject.sin_port = CFSwapInt16HostToBig(port)

        addressObject.sin_addr.s_addr = inet_addr(address)
        
        let sin_length = addressObject.sin_len

        let result = withUnsafePointer(to: &addressObject, { addressPointer in
            
            addressPointer.withMemoryRebound(to: sockaddr.self, capacity: 1) { addressSecondPointer -> Int32 in
                let addressMutablePointer = UnsafeMutablePointer(mutating: addressSecondPointer)
                let result = socket_bind(self.socketHandler, addressMutablePointer, socklen_t(sin_length))
                return result
            }
        })
        if result != 0 {
            // something failed
            self.isBound = false
            return false
        }
        return true
        
    }
    
    public func connect(address: String, port: UInt16, theirNodeId: [UInt8]) -> Bool {
        
        var addressObject = sockaddr_in()
        addressObject.sin_len = UInt8(MemoryLayout.size(ofValue: addressObject))
        addressObject.sin_family = sa_family_t(AF_INET)
        addressObject.sin_port = CFSwapInt16HostToBig(port)

        addressObject.sin_addr.s_addr = inet_addr(address)
        
        let sin_length = addressObject.sin_len
        let publicKey = Bindings.new_LDKPublicKey(array: theirNodeId)

        let result = withUnsafePointer(to: &addressObject, { addressPointer in
            
            addressPointer.withMemoryRebound(to: sockaddr.self, capacity: 1) { addressSecondPointer -> Int32 in
                let addressMutablePointer = UnsafeMutablePointer(mutating: addressSecondPointer)
                let result = socket_connect(self.socketHandler, publicKey, addressMutablePointer, Int(socklen_t(sin_length)))
                return result
            }
        })
        
        if result != 0 {
            // something failed
            return false
        }
        return true
        
    }
    
    public func interrupt() {
        interrupt_socket_handling(self.socketHandler)
    }
    
}
