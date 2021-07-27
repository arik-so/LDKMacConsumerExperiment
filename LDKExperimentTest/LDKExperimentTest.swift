//
//  LDKExperimentTest.swift
//  LDKExperimentTest
//
//  Created by Arik Sosman on 7/27/21.
//

import XCTest
@testable import LDKMacConsumerExperiment

class LDKExperimentTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testVersionSanity() throws {
        check_get_ldk_version()
        check_get_ldk_bindings_version()
        check_platform()
    }
    
    func testExtendedActivity() {
        // for i in 0...(1 << 7) {
        for i in 0..<1 { // only do one test run initially
            let nice_close =                   (i & (1 << 0)) != 0;
            let use_km_wrapper =               (i & (1 << 1)) != 0;
            let use_manual_watch =             (i & (1 << 2)) != 0;
            let reload_peers =                 (i & (1 << 3)) != 0;
            let break_cross_refs =             (i & (1 << 4)) != 0;
            let nio_peer_handler =             true // (i & (1 << 5)) != 0;
            let use_chan_manager_constructor = true //  (i & (1 << 6)) != 0;
            
            if (break_cross_refs && !reload_peers) {
                // There are no cross refs to break without reloading peers.
                continue;
            }
            
            if (use_chan_manager_constructor && (use_manual_watch || !nio_peer_handler)) {
                // ChannelManagerConstructor requires a ChainMonitor as the Watch and creates a NioPeerHandler for us.
                continue;
            }
            
            print("Running test with flags \(i)");
            try? SimulationRunner.do_test(nice_close: nice_close, use_km_wrapper: use_km_wrapper, use_manual_watch: use_manual_watch, reload_peers: reload_peers, break_cross_peer_refs: break_cross_refs, nio_peer_handler: nio_peer_handler, use_chan_manager_constructor: use_chan_manager_constructor)
        }
        
        // avoid early termination
        /*
        print("Press enter to stop running test.")
        let keyboard = FileHandle.standardInput
        let inputData = keyboard.availableData
        let strData = String(data: inputData, encoding: String.Encoding.utf8)!
        */
        
    }
    
    fileprivate class SimulationRunner {
        
        class func do_test(nice_close: Bool, use_km_wrapper: Bool, use_manual_watch: Bool, reload_peers: Bool, break_cross_peer_refs: Bool, nio_peer_handler: Bool, use_chan_manager_constructor: Bool) throws {
            
            let instance = do_test_run(nice_close: nice_close, use_km_wrapper: use_km_wrapper, use_manual_watch: use_manual_watch, reload_peers: reload_peers, break_cross_peer_refs: break_cross_peer_refs, nio_peer_handler: nio_peer_handler, use_chan_manager_constructor: use_chan_manager_constructor)
            
        }
        
        class func do_test_run(nice_close: Bool, use_km_wrapper: Bool, use_manual_watch: Bool, reload_peers: Bool, break_cross_peer_refs: Bool, nio_peer_handler: Bool, use_chan_manager_constructor: Bool) -> HumanObjectPeerTestInstance {
            
            let instance = HumanObjectPeerTestInstance(nice_close: nice_close, use_km_wrapper: use_km_wrapper, use_manual_watch: use_manual_watch, reload_peers: reload_peers, break_cross_peer_refs: break_cross_peer_refs, use_nio_peer_handler: nio_peer_handler, use_filter: !nio_peer_handler, use_chan_manager_constructor: use_chan_manager_constructor)
            
            instance.do_test_message_handler()
            return instance
        }
        
    }
    
    

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    

}
