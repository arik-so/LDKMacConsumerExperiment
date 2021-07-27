public class ReplyChannelRange {

    public internal(set) var cOpaqueStruct: LDKReplyChannelRange?;

	/* DEFAULT_CONSTRUCTOR_START */
    public init(chain_hash_arg: [UInt8], first_blocknum_arg: UInt32, number_of_blocks_arg: UInt32, sync_complete_arg: Bool, short_channel_ids_arg: [UInt64]) {
    	
        self.cOpaqueStruct = ReplyChannelRange_new(Bindings.new_LDKThirtyTwoBytes(array: chain_hash_arg), first_blocknum_arg, number_of_blocks_arg, sync_complete_arg, Bindings.new_LDKCVec_u64Z(array: short_channel_ids_arg))
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKReplyChannelRange){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func get_chain_hash() -> [UInt8] {
    	
        return Bindings.tuple32_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKReplyChannelRange>) in
ReplyChannelRange_get_chain_hash(this_ptrPointer)
}.pointee);
    }

    public func set_chain_hash(val: [UInt8]) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKReplyChannelRange>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return ReplyChannelRange_set_chain_hash(this_ptrPointer, Bindings.new_LDKThirtyTwoBytes(array: val));
    }

    public func get_first_blocknum() -> UInt32 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKReplyChannelRange>) in
ReplyChannelRange_get_first_blocknum(this_ptrPointer)
};
    }

    public func set_first_blocknum(val: UInt32) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKReplyChannelRange>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return ReplyChannelRange_set_first_blocknum(this_ptrPointer, val);
    }

    public func get_number_of_blocks() -> UInt32 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKReplyChannelRange>) in
ReplyChannelRange_get_number_of_blocks(this_ptrPointer)
};
    }

    public func set_number_of_blocks(val: UInt32) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKReplyChannelRange>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return ReplyChannelRange_set_number_of_blocks(this_ptrPointer, val);
    }

    public func get_sync_complete() -> Bool {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKReplyChannelRange>) in
ReplyChannelRange_get_sync_complete(this_ptrPointer)
};
    }

    public func set_sync_complete(val: Bool) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKReplyChannelRange>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return ReplyChannelRange_set_sync_complete(this_ptrPointer, val);
    }

    public func set_short_channel_ids(val: [UInt64]) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKReplyChannelRange>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return ReplyChannelRange_set_short_channel_ids(this_ptrPointer, Bindings.new_LDKCVec_u64Z(array: val));
    }

    public func clone(orig: ReplyChannelRange) -> ReplyChannelRange {
    	
        return withUnsafePointer(to: orig.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKReplyChannelRange>) in
ReplyChannelRange(pointer: ReplyChannelRange_clone(origPointer))
};
    }

    public func read(ser: [UInt8]) -> Result_ReplyChannelRangeDecodeErrorZ {
    	
        return Result_ReplyChannelRangeDecodeErrorZ(pointer: ReplyChannelRange_read(Bindings.new_LDKu8slice(array: ser)));
    }

    public func write(obj: ReplyChannelRange) -> [UInt8] {
    	
        return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: obj.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKReplyChannelRange>) in
ReplyChannelRange_write(objPointer)
});
    }

				
	deinit {
					if self.cOpaqueStruct?.is_owned == false {

					
					
		ReplyChannelRange_free(self.cOpaqueStruct!)
					
}
				
	}
			
    /* STRUCT_METHODS_END */

}
