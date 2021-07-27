public class OutPoint {

    public internal(set) var cOpaqueStruct: LDKOutPoint?;

	/* DEFAULT_CONSTRUCTOR_START */
    public init(txid_arg: [UInt8], index_arg: UInt16) {
    	
        self.cOpaqueStruct = OutPoint_new(Bindings.new_LDKThirtyTwoBytes(array: txid_arg), index_arg)
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKOutPoint){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func get_txid() -> [UInt8] {
    	
        return Bindings.tuple32_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKOutPoint>) in
OutPoint_get_txid(this_ptrPointer)
}.pointee);
    }

    public func set_txid(val: [UInt8]) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKOutPoint>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return OutPoint_set_txid(this_ptrPointer, Bindings.new_LDKThirtyTwoBytes(array: val));
    }

    public func get_index() -> UInt16 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKOutPoint>) in
OutPoint_get_index(this_ptrPointer)
};
    }

    public func set_index(val: UInt16) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKOutPoint>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return OutPoint_set_index(this_ptrPointer, val);
    }

    public func clone(orig: OutPoint) -> OutPoint {
    	
        return withUnsafePointer(to: orig.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKOutPoint>) in
OutPoint(pointer: OutPoint_clone(origPointer))
};
    }

    public func eq(a: OutPoint, b: OutPoint) -> Bool {
    	
        return withUnsafePointer(to: a.cOpaqueStruct!) { (aPointer: UnsafePointer<LDKOutPoint>) in
withUnsafePointer(to: b.cOpaqueStruct!) { (bPointer: UnsafePointer<LDKOutPoint>) in
OutPoint_eq(aPointer, bPointer)
}
};
    }

    public func hash(o: OutPoint) -> UInt64 {
    	
        return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKOutPoint>) in
OutPoint_hash(oPointer)
};
    }

    public func to_channel_id() -> [UInt8] {
    	
        return Bindings.LDKThirtyTwoBytes_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKOutPoint>) in
OutPoint_to_channel_id(this_argPointer)
});
    }

    public func write(obj: OutPoint) -> [UInt8] {
    	
        return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: obj.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKOutPoint>) in
OutPoint_write(objPointer)
});
    }

    public func read(ser: [UInt8]) -> Result_OutPointDecodeErrorZ {
    	
        return Result_OutPointDecodeErrorZ(pointer: OutPoint_read(Bindings.new_LDKu8slice(array: ser)));
    }

				
	deinit {
					if self.cOpaqueStruct?.is_owned == false {

					
					
		OutPoint_free(self.cOpaqueStruct!)
					
}
				
	}
			
    /* STRUCT_METHODS_END */

}
