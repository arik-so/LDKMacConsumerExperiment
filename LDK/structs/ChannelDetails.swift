public class ChannelDetails {

    public internal(set) var cOpaqueStruct: LDKChannelDetails?;

	/* DEFAULT_CONSTRUCTOR_START */
    public init(channel_id_arg: [UInt8], counterparty_arg: ChannelCounterparty, funding_txo_arg: OutPoint, short_channel_id_arg: Option_u64Z, channel_value_satoshis_arg: UInt64, unspendable_punishment_reserve_arg: Option_u64Z, user_id_arg: UInt64, outbound_capacity_msat_arg: UInt64, inbound_capacity_msat_arg: UInt64, confirmations_required_arg: Option_u32Z, force_close_spend_delay_arg: Option_u16Z, is_outbound_arg: Bool, is_funding_locked_arg: Bool, is_usable_arg: Bool, is_public_arg: Bool) {
    	
        self.cOpaqueStruct = ChannelDetails_new(Bindings.new_LDKThirtyTwoBytes(array: channel_id_arg), counterparty_arg.cOpaqueStruct!, funding_txo_arg.cOpaqueStruct!, short_channel_id_arg.cOpaqueStruct!, channel_value_satoshis_arg, unspendable_punishment_reserve_arg.cOpaqueStruct!, user_id_arg, outbound_capacity_msat_arg, inbound_capacity_msat_arg, confirmations_required_arg.cOpaqueStruct!, force_close_spend_delay_arg.cOpaqueStruct!, is_outbound_arg, is_funding_locked_arg, is_usable_arg, is_public_arg)
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKChannelDetails){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func get_channel_id() -> [UInt8] {
    	
        return Bindings.tuple32_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKChannelDetails>) in
ChannelDetails_get_channel_id(this_ptrPointer)
}.pointee);
    }

    public func set_channel_id(val: [UInt8]) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKChannelDetails>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return ChannelDetails_set_channel_id(this_ptrPointer, Bindings.new_LDKThirtyTwoBytes(array: val));
    }

    public func get_counterparty() -> ChannelCounterparty {
    	
        return ChannelCounterparty(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKChannelDetails>) in
ChannelDetails_get_counterparty(this_ptrPointer)
});
    }

    public func set_counterparty(val: ChannelCounterparty) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKChannelDetails>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return ChannelDetails_set_counterparty(this_ptrPointer, val.cOpaqueStruct!);
    }

    public func get_funding_txo() -> OutPoint {
    	
        return OutPoint(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKChannelDetails>) in
ChannelDetails_get_funding_txo(this_ptrPointer)
});
    }

    public func set_funding_txo(val: OutPoint) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKChannelDetails>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return ChannelDetails_set_funding_txo(this_ptrPointer, val.cOpaqueStruct!);
    }

    public func get_short_channel_id() -> Option_u64Z {
    	
        return Option_u64Z(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKChannelDetails>) in
ChannelDetails_get_short_channel_id(this_ptrPointer)
});
    }

    public func set_short_channel_id(val: Option_u64Z) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKChannelDetails>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return ChannelDetails_set_short_channel_id(this_ptrPointer, val.cOpaqueStruct!);
    }

    public func get_channel_value_satoshis() -> UInt64 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKChannelDetails>) in
ChannelDetails_get_channel_value_satoshis(this_ptrPointer)
};
    }

    public func set_channel_value_satoshis(val: UInt64) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKChannelDetails>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return ChannelDetails_set_channel_value_satoshis(this_ptrPointer, val);
    }

    public func get_unspendable_punishment_reserve() -> Option_u64Z {
    	
        return Option_u64Z(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKChannelDetails>) in
ChannelDetails_get_unspendable_punishment_reserve(this_ptrPointer)
});
    }

    public func set_unspendable_punishment_reserve(val: Option_u64Z) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKChannelDetails>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return ChannelDetails_set_unspendable_punishment_reserve(this_ptrPointer, val.cOpaqueStruct!);
    }

    public func get_user_id() -> UInt64 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKChannelDetails>) in
ChannelDetails_get_user_id(this_ptrPointer)
};
    }

    public func set_user_id(val: UInt64) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKChannelDetails>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return ChannelDetails_set_user_id(this_ptrPointer, val);
    }

    public func get_outbound_capacity_msat() -> UInt64 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKChannelDetails>) in
ChannelDetails_get_outbound_capacity_msat(this_ptrPointer)
};
    }

    public func set_outbound_capacity_msat(val: UInt64) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKChannelDetails>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return ChannelDetails_set_outbound_capacity_msat(this_ptrPointer, val);
    }

    public func get_inbound_capacity_msat() -> UInt64 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKChannelDetails>) in
ChannelDetails_get_inbound_capacity_msat(this_ptrPointer)
};
    }

    public func set_inbound_capacity_msat(val: UInt64) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKChannelDetails>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return ChannelDetails_set_inbound_capacity_msat(this_ptrPointer, val);
    }

    public func get_confirmations_required() -> Option_u32Z {
    	
        return Option_u32Z(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKChannelDetails>) in
ChannelDetails_get_confirmations_required(this_ptrPointer)
});
    }

    public func set_confirmations_required(val: Option_u32Z) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKChannelDetails>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return ChannelDetails_set_confirmations_required(this_ptrPointer, val.cOpaqueStruct!);
    }

    public func get_force_close_spend_delay() -> Option_u16Z {
    	
        return Option_u16Z(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKChannelDetails>) in
ChannelDetails_get_force_close_spend_delay(this_ptrPointer)
});
    }

    public func set_force_close_spend_delay(val: Option_u16Z) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKChannelDetails>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return ChannelDetails_set_force_close_spend_delay(this_ptrPointer, val.cOpaqueStruct!);
    }

    public func get_is_outbound() -> Bool {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKChannelDetails>) in
ChannelDetails_get_is_outbound(this_ptrPointer)
};
    }

    public func set_is_outbound(val: Bool) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKChannelDetails>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return ChannelDetails_set_is_outbound(this_ptrPointer, val);
    }

    public func get_is_funding_locked() -> Bool {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKChannelDetails>) in
ChannelDetails_get_is_funding_locked(this_ptrPointer)
};
    }

    public func set_is_funding_locked(val: Bool) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKChannelDetails>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return ChannelDetails_set_is_funding_locked(this_ptrPointer, val);
    }

    public func get_is_usable() -> Bool {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKChannelDetails>) in
ChannelDetails_get_is_usable(this_ptrPointer)
};
    }

    public func set_is_usable(val: Bool) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKChannelDetails>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return ChannelDetails_set_is_usable(this_ptrPointer, val);
    }

    public func get_is_public() -> Bool {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKChannelDetails>) in
ChannelDetails_get_is_public(this_ptrPointer)
};
    }

    public func set_is_public(val: Bool) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKChannelDetails>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return ChannelDetails_set_is_public(this_ptrPointer, val);
    }

    public func clone(orig: ChannelDetails) -> ChannelDetails {
    	
        return withUnsafePointer(to: orig.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKChannelDetails>) in
ChannelDetails(pointer: ChannelDetails_clone(origPointer))
};
    }

				
	deinit {
					if self.cOpaqueStruct?.is_owned == false {

					
					
		ChannelDetails_free(self.cOpaqueStruct!)
					
}
				
	}
			
    /* STRUCT_METHODS_END */

}
