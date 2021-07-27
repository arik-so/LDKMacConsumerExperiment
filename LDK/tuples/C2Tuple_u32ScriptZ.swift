public class C2Tuple_u32ScriptZ {

    public internal(set) var cOpaqueStruct: LDKC2Tuple_u32ScriptZ?;

    public init(pointer: LDKC2Tuple_u32ScriptZ){
		self.cOpaqueStruct = pointer
	}

    /* TUPLE_METHODS_START */

    public func clone(orig: C2Tuple_u32ScriptZ) -> C2Tuple_u32ScriptZ {
    	
						
		let origPointer = withUnsafePointer(to: orig.cOpaqueStruct!) { (pointer: UnsafePointer<LDKC2Tuple_u32ScriptZ>) in
							
			pointer
						
		}
					
        return C2Tuple_u32ScriptZ(pointer: C2Tuple_u32ScriptZ_clone(origPointer));
    }

    public func new(a: UInt32, b: [UInt8]) -> C2Tuple_u32ScriptZ {
    	
        return C2Tuple_u32ScriptZ(pointer: C2Tuple_u32ScriptZ_new(a, Bindings.new_LDKCVec_u8Z(array: b)));
    }

				
	deinit {
					
					
					
		C2Tuple_u32ScriptZ_free(self.cOpaqueStruct!)
				
	}
			
    /* TUPLE_METHODS_END */

}
