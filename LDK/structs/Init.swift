public class Init {

    public internal(set) var cOpaqueStruct: LDKInit?;

	/* DEFAULT_CONSTRUCTOR_START */
    public init(features_arg: InitFeatures) {
    	
        self.cOpaqueStruct = Init_new(features_arg.cOpaqueStruct!)
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKInit){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func get_features() -> InitFeatures {
    	
        return InitFeatures(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKInit>) in
Init_get_features(this_ptrPointer)
});
    }

    public func set_features(val: InitFeatures) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKInit>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return Init_set_features(this_ptrPointer, val.cOpaqueStruct!);
    }

    public func clone(orig: Init) -> Init {
    	
        return withUnsafePointer(to: orig.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKInit>) in
Init(pointer: Init_clone(origPointer))
};
    }

    public func write(obj: Init) -> [UInt8] {
    	
        return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: obj.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKInit>) in
Init_write(objPointer)
});
    }

    public func read(ser: [UInt8]) -> Result_InitDecodeErrorZ {
    	
        return Result_InitDecodeErrorZ(pointer: Init_read(Bindings.new_LDKu8slice(array: ser)));
    }

				
	deinit {
					if self.cOpaqueStruct?.is_owned == false {

					
					
		Init_free(self.cOpaqueStruct!)
					
}
				
	}
			
    /* STRUCT_METHODS_END */

}
