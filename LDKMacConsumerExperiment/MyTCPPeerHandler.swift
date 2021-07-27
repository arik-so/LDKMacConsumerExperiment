//
//  TCPPeerHandler.swift
//  LDKSwiftARC
//
//  Created by Arik Sosman on 7/8/21.
//

import Foundation
//import LDKFramework

public class MyTCPPeerHandler {
    
    private var peerManager: PeerManager?
    private var socketHandler: UnsafeMutableRawPointer?
    private var isBound = false
    
    public init(){
        print("TCPPeerHandler self.init address: \(Unmanaged<MyTCPPeerHandler>.passUnretained(self).toOpaque())")
    }
    
    public func setup(peerManager: PeerManager) {
        self.peerManager = peerManager
        // let secondPointer = UnsafePointer<LDKPeerManager>
        let socketHandler = withUnsafePointer(to: self.peerManager!.cOpaqueStruct!) { (pointer: UnsafePointer<LDKPeerManager>) -> UnsafeMutableRawPointer? in
            let mutablePointer = UnsafeMutablePointer<LDKPeerManager>(mutating: pointer)
            mutablePointer.pointee.is_owned = false
            print("pointee's ownability: \(pointer.pointee.is_owned)")
            print("pointee's address: \(MemoryAddress(of: &mutablePointer.pointee))")
            print("pointee's inner address: \(MemoryAddress(of: &mutablePointer.pointee.inner!))")
            let socketHandler = init_socket_handling(mutablePointer)
            return socketHandler
        }
        self.socketHandler = socketHandler
        print("TCPPeerHandler self.setup address: \(Unmanaged<MyTCPPeerHandler>.passUnretained(self).toOpaque())")
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



struct MemoryAddress<T>: CustomStringConvertible {

    let intValue: Int

    var description: String {
        let length = 2 + 2 * MemoryLayout<UnsafeRawPointer>.size
        return String(format: "%0\(length)p", intValue)
    }

    // for structures
    init(of structPointer: UnsafePointer<T>) {
        intValue = Int(bitPattern: structPointer)
    }
}

extension MemoryAddress where T: AnyObject {

    // for classes
    init(of classInstance: T) {
        intValue = unsafeBitCast(classInstance, to: Int.self)
        // or      Int(bitPattern: Unmanaged<T>.passUnretained(classInstance).toOpaque())
    }
}

