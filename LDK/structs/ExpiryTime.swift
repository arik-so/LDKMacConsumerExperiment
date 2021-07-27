public class ExpiryTime {

    public internal(set) var cOpaqueStruct: LDKExpiryTime?;

	

    public init(pointer: LDKExpiryTime){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func eq(a: ExpiryTime, b: ExpiryTime) -> Bool {
    	
        return withUnsafePointer(to: a.cOpaqueStruct!) { (aPointer: UnsafePointer<LDKExpiryTime>) in
withUnsafePointer(to: b.cOpaqueStruct!) { (bPointer: UnsafePointer<LDKExpiryTime>) in
ExpiryTime_eq(aPointer, bPointer)
}
};
    }

    public func clone(orig: ExpiryTime) -> ExpiryTime {
    	
        return withUnsafePointer(to: orig.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKExpiryTime>) in
ExpiryTime(pointer: ExpiryTime_clone(origPointer))
};
    }

    public func from_seconds(seconds: UInt64) -> Result_ExpiryTimeCreationErrorZ {
    	
        return Result_ExpiryTimeCreationErrorZ(pointer: ExpiryTime_from_seconds(seconds));
    }

    public func from_duration(duration: UInt64) -> Result_ExpiryTimeCreationErrorZ {
    	
        return Result_ExpiryTimeCreationErrorZ(pointer: ExpiryTime_from_duration(duration));
    }

    public func as_seconds() -> UInt64 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKExpiryTime>) in
ExpiryTime_as_seconds(this_argPointer)
};
    }

    public func as_duration() -> UInt64 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKExpiryTime>) in
ExpiryTime_as_duration(this_argPointer)
};
    }

				
	deinit {
					if self.cOpaqueStruct?.is_owned == false {

					
					
		ExpiryTime_free(self.cOpaqueStruct!)
					
}
				
	}
			
    /* STRUCT_METHODS_END */

}
