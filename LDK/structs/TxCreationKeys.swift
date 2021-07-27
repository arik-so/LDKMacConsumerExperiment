public class TxCreationKeys {

    public internal(set) var cOpaqueStruct: LDKTxCreationKeys?;

	/* DEFAULT_CONSTRUCTOR_START */
    public init(per_commitment_point_arg: [UInt8], revocation_key_arg: [UInt8], broadcaster_htlc_key_arg: [UInt8], countersignatory_htlc_key_arg: [UInt8], broadcaster_delayed_payment_key_arg: [UInt8]) {
    	
        self.cOpaqueStruct = TxCreationKeys_new(Bindings.new_LDKPublicKey(array: per_commitment_point_arg), Bindings.new_LDKPublicKey(array: revocation_key_arg), Bindings.new_LDKPublicKey(array: broadcaster_htlc_key_arg), Bindings.new_LDKPublicKey(array: countersignatory_htlc_key_arg), Bindings.new_LDKPublicKey(array: broadcaster_delayed_payment_key_arg))
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKTxCreationKeys){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func get_per_commitment_point() -> [UInt8] {
    	
        return Bindings.LDKPublicKey_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKTxCreationKeys>) in
TxCreationKeys_get_per_commitment_point(this_ptrPointer)
});
    }

    public func set_per_commitment_point(val: [UInt8]) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKTxCreationKeys>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return TxCreationKeys_set_per_commitment_point(this_ptrPointer, Bindings.new_LDKPublicKey(array: val));
    }

    public func get_revocation_key() -> [UInt8] {
    	
        return Bindings.LDKPublicKey_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKTxCreationKeys>) in
TxCreationKeys_get_revocation_key(this_ptrPointer)
});
    }

    public func set_revocation_key(val: [UInt8]) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKTxCreationKeys>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return TxCreationKeys_set_revocation_key(this_ptrPointer, Bindings.new_LDKPublicKey(array: val));
    }

    public func get_broadcaster_htlc_key() -> [UInt8] {
    	
        return Bindings.LDKPublicKey_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKTxCreationKeys>) in
TxCreationKeys_get_broadcaster_htlc_key(this_ptrPointer)
});
    }

    public func set_broadcaster_htlc_key(val: [UInt8]) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKTxCreationKeys>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return TxCreationKeys_set_broadcaster_htlc_key(this_ptrPointer, Bindings.new_LDKPublicKey(array: val));
    }

    public func get_countersignatory_htlc_key() -> [UInt8] {
    	
        return Bindings.LDKPublicKey_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKTxCreationKeys>) in
TxCreationKeys_get_countersignatory_htlc_key(this_ptrPointer)
});
    }

    public func set_countersignatory_htlc_key(val: [UInt8]) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKTxCreationKeys>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return TxCreationKeys_set_countersignatory_htlc_key(this_ptrPointer, Bindings.new_LDKPublicKey(array: val));
    }

    public func get_broadcaster_delayed_payment_key() -> [UInt8] {
    	
        return Bindings.LDKPublicKey_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKTxCreationKeys>) in
TxCreationKeys_get_broadcaster_delayed_payment_key(this_ptrPointer)
});
    }

    public func set_broadcaster_delayed_payment_key(val: [UInt8]) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKTxCreationKeys>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return TxCreationKeys_set_broadcaster_delayed_payment_key(this_ptrPointer, Bindings.new_LDKPublicKey(array: val));
    }

    public func clone(orig: TxCreationKeys) -> TxCreationKeys {
    	
        return withUnsafePointer(to: orig.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKTxCreationKeys>) in
TxCreationKeys(pointer: TxCreationKeys_clone(origPointer))
};
    }

    public func write(obj: TxCreationKeys) -> [UInt8] {
    	
        return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: obj.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKTxCreationKeys>) in
TxCreationKeys_write(objPointer)
});
    }

    public func read(ser: [UInt8]) -> Result_TxCreationKeysDecodeErrorZ {
    	
        return Result_TxCreationKeysDecodeErrorZ(pointer: TxCreationKeys_read(Bindings.new_LDKu8slice(array: ser)));
    }

    public func derive_new(per_commitment_point: [UInt8], broadcaster_delayed_payment_base: [UInt8], broadcaster_htlc_base: [UInt8], countersignatory_revocation_base: [UInt8], countersignatory_htlc_base: [UInt8]) -> Result_TxCreationKeysErrorZ {
    	
        return Result_TxCreationKeysErrorZ(pointer: TxCreationKeys_derive_new(Bindings.new_LDKPublicKey(array: per_commitment_point), Bindings.new_LDKPublicKey(array: broadcaster_delayed_payment_base), Bindings.new_LDKPublicKey(array: broadcaster_htlc_base), Bindings.new_LDKPublicKey(array: countersignatory_revocation_base), Bindings.new_LDKPublicKey(array: countersignatory_htlc_base)));
    }

    public func from_channel_static_keys(per_commitment_point: [UInt8], broadcaster_keys: ChannelPublicKeys, countersignatory_keys: ChannelPublicKeys) -> Result_TxCreationKeysErrorZ {
    	
        return Result_TxCreationKeysErrorZ(pointer: withUnsafePointer(to: broadcaster_keys.cOpaqueStruct!) { (broadcaster_keysPointer: UnsafePointer<LDKChannelPublicKeys>) in
withUnsafePointer(to: countersignatory_keys.cOpaqueStruct!) { (countersignatory_keysPointer: UnsafePointer<LDKChannelPublicKeys>) in
TxCreationKeys_from_channel_static_keys(Bindings.new_LDKPublicKey(array: per_commitment_point), broadcaster_keysPointer, countersignatory_keysPointer)
}
});
    }

				
	deinit {
					if self.cOpaqueStruct?.is_owned == false {

					
					
		TxCreationKeys_free(self.cOpaqueStruct!)
					
}
				
	}
			
    /* STRUCT_METHODS_END */

}
