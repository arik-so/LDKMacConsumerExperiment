public class RouteHint {

    public internal(set) var cOpaqueStruct: LDKRouteHint?;

	

    public init(pointer: LDKRouteHint){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func eq(a: RouteHint, b: RouteHint) -> Bool {
    	
        return withUnsafePointer(to: a.cOpaqueStruct!) { (aPointer: UnsafePointer<LDKRouteHint>) in
withUnsafePointer(to: b.cOpaqueStruct!) { (bPointer: UnsafePointer<LDKRouteHint>) in
RouteHint_eq(aPointer, bPointer)
}
};
    }

    public func clone(orig: RouteHint) -> RouteHint {
    	
        return withUnsafePointer(to: orig.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKRouteHint>) in
RouteHint(pointer: RouteHint_clone(origPointer))
};
    }

				
	deinit {
					if self.cOpaqueStruct?.is_owned == false {

					
					
		RouteHint_free(self.cOpaqueStruct!)
					
}
				
	}
			
    /* STRUCT_METHODS_END */

}
