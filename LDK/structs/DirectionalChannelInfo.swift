public class DirectionalChannelInfo {

    public internal(set) var cOpaqueStruct: LDKDirectionalChannelInfo?;

	/* DEFAULT_CONSTRUCTOR_START */
    public init(last_update_arg: UInt32, enabled_arg: Bool, cltv_expiry_delta_arg: UInt16, htlc_minimum_msat_arg: UInt64, htlc_maximum_msat_arg: Option_u64Z, fees_arg: RoutingFees, last_update_message_arg: ChannelUpdate) {
    	
        self.cOpaqueStruct = DirectionalChannelInfo_new(last_update_arg, enabled_arg, cltv_expiry_delta_arg, htlc_minimum_msat_arg, htlc_maximum_msat_arg.cOpaqueStruct!, fees_arg.cOpaqueStruct!, last_update_message_arg.cOpaqueStruct!)
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKDirectionalChannelInfo){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func get_last_update() -> UInt32 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKDirectionalChannelInfo>) in
DirectionalChannelInfo_get_last_update(this_ptrPointer)
};
    }

    public func set_last_update(val: UInt32) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKDirectionalChannelInfo>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return DirectionalChannelInfo_set_last_update(this_ptrPointer, val);
    }

    public func get_enabled() -> Bool {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKDirectionalChannelInfo>) in
DirectionalChannelInfo_get_enabled(this_ptrPointer)
};
    }

    public func set_enabled(val: Bool) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKDirectionalChannelInfo>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return DirectionalChannelInfo_set_enabled(this_ptrPointer, val);
    }

    public func get_cltv_expiry_delta() -> UInt16 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKDirectionalChannelInfo>) in
DirectionalChannelInfo_get_cltv_expiry_delta(this_ptrPointer)
};
    }

    public func set_cltv_expiry_delta(val: UInt16) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKDirectionalChannelInfo>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return DirectionalChannelInfo_set_cltv_expiry_delta(this_ptrPointer, val);
    }

    public func get_htlc_minimum_msat() -> UInt64 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKDirectionalChannelInfo>) in
DirectionalChannelInfo_get_htlc_minimum_msat(this_ptrPointer)
};
    }

    public func set_htlc_minimum_msat(val: UInt64) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKDirectionalChannelInfo>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return DirectionalChannelInfo_set_htlc_minimum_msat(this_ptrPointer, val);
    }

    public func get_htlc_maximum_msat() -> Option_u64Z {
    	
        return Option_u64Z(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKDirectionalChannelInfo>) in
DirectionalChannelInfo_get_htlc_maximum_msat(this_ptrPointer)
});
    }

    public func set_htlc_maximum_msat(val: Option_u64Z) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKDirectionalChannelInfo>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return DirectionalChannelInfo_set_htlc_maximum_msat(this_ptrPointer, val.cOpaqueStruct!);
    }

    public func get_fees() -> RoutingFees {
    	
        return RoutingFees(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKDirectionalChannelInfo>) in
DirectionalChannelInfo_get_fees(this_ptrPointer)
});
    }

    public func set_fees(val: RoutingFees) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKDirectionalChannelInfo>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return DirectionalChannelInfo_set_fees(this_ptrPointer, val.cOpaqueStruct!);
    }

    public func get_last_update_message() -> ChannelUpdate {
    	
        return ChannelUpdate(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKDirectionalChannelInfo>) in
DirectionalChannelInfo_get_last_update_message(this_ptrPointer)
});
    }

    public func set_last_update_message(val: ChannelUpdate) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKDirectionalChannelInfo>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return DirectionalChannelInfo_set_last_update_message(this_ptrPointer, val.cOpaqueStruct!);
    }

    public func clone(orig: DirectionalChannelInfo) -> DirectionalChannelInfo {
    	
        return withUnsafePointer(to: orig.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKDirectionalChannelInfo>) in
DirectionalChannelInfo(pointer: DirectionalChannelInfo_clone(origPointer))
};
    }

    public func write(obj: DirectionalChannelInfo) -> [UInt8] {
    	
        return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: obj.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKDirectionalChannelInfo>) in
DirectionalChannelInfo_write(objPointer)
});
    }

    public func read(ser: [UInt8]) -> Result_DirectionalChannelInfoDecodeErrorZ {
    	
        return Result_DirectionalChannelInfoDecodeErrorZ(pointer: DirectionalChannelInfo_read(Bindings.new_LDKu8slice(array: ser)));
    }

				
	deinit {
					if self.cOpaqueStruct?.is_owned == false {

					
					
		DirectionalChannelInfo_free(self.cOpaqueStruct!)
					
}
				
	}
			
    /* STRUCT_METHODS_END */

}
