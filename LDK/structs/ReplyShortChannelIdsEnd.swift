public class ReplyShortChannelIdsEnd {

    public internal(set) var cOpaqueStruct: LDKReplyShortChannelIdsEnd?;

	/* DEFAULT_CONSTRUCTOR_START */
    public init(chain_hash_arg: [UInt8], full_information_arg: Bool) {
    	
        self.cOpaqueStruct = ReplyShortChannelIdsEnd_new(Bindings.new_LDKThirtyTwoBytes(array: chain_hash_arg), full_information_arg)
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKReplyShortChannelIdsEnd){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func get_chain_hash() -> [UInt8] {
    	
        return Bindings.tuple32_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKReplyShortChannelIdsEnd>) in
ReplyShortChannelIdsEnd_get_chain_hash(this_ptrPointer)
}.pointee);
    }

    public func set_chain_hash(val: [UInt8]) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKReplyShortChannelIdsEnd>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return ReplyShortChannelIdsEnd_set_chain_hash(this_ptrPointer, Bindings.new_LDKThirtyTwoBytes(array: val));
    }

    public func get_full_information() -> Bool {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKReplyShortChannelIdsEnd>) in
ReplyShortChannelIdsEnd_get_full_information(this_ptrPointer)
};
    }

    public func set_full_information(val: Bool) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKReplyShortChannelIdsEnd>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return ReplyShortChannelIdsEnd_set_full_information(this_ptrPointer, val);
    }

    public func clone(orig: ReplyShortChannelIdsEnd) -> ReplyShortChannelIdsEnd {
    	
        return withUnsafePointer(to: orig.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKReplyShortChannelIdsEnd>) in
ReplyShortChannelIdsEnd(pointer: ReplyShortChannelIdsEnd_clone(origPointer))
};
    }

    public func read(ser: [UInt8]) -> Result_ReplyShortChannelIdsEndDecodeErrorZ {
    	
        return Result_ReplyShortChannelIdsEndDecodeErrorZ(pointer: ReplyShortChannelIdsEnd_read(Bindings.new_LDKu8slice(array: ser)));
    }

    public func write(obj: ReplyShortChannelIdsEnd) -> [UInt8] {
    	
        return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: obj.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKReplyShortChannelIdsEnd>) in
ReplyShortChannelIdsEnd_write(objPointer)
});
    }

				
	deinit {
					if self.cOpaqueStruct?.is_owned == false {

					
					
		ReplyShortChannelIdsEnd_free(self.cOpaqueStruct!)
					
}
				
	}
			
    /* STRUCT_METHODS_END */

}
