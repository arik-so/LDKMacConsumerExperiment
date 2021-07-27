public class Ping {

    public internal(set) var cOpaqueStruct: LDKPing?;

	/* DEFAULT_CONSTRUCTOR_START */
    public init(ponglen_arg: UInt16, byteslen_arg: UInt16) {
    	
        self.cOpaqueStruct = Ping_new(ponglen_arg, byteslen_arg)
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKPing){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func get_ponglen() -> UInt16 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKPing>) in
Ping_get_ponglen(this_ptrPointer)
};
    }

    public func set_ponglen(val: UInt16) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKPing>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return Ping_set_ponglen(this_ptrPointer, val);
    }

    public func get_byteslen() -> UInt16 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKPing>) in
Ping_get_byteslen(this_ptrPointer)
};
    }

    public func set_byteslen(val: UInt16) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKPing>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return Ping_set_byteslen(this_ptrPointer, val);
    }

    public func clone(orig: Ping) -> Ping {
    	
        return withUnsafePointer(to: orig.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKPing>) in
Ping(pointer: Ping_clone(origPointer))
};
    }

    public func write(obj: Ping) -> [UInt8] {
    	
        return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: obj.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKPing>) in
Ping_write(objPointer)
});
    }

    public func read(ser: [UInt8]) -> Result_PingDecodeErrorZ {
    	
        return Result_PingDecodeErrorZ(pointer: Ping_read(Bindings.new_LDKu8slice(array: ser)));
    }

				
	deinit {
					if self.cOpaqueStruct?.is_owned == false {

					
					
		Ping_free(self.cOpaqueStruct!)
					
}
				
	}
			
    /* STRUCT_METHODS_END */

}
