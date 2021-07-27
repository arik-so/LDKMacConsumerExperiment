public class InvoiceSignature {

    public internal(set) var cOpaqueStruct: LDKInvoiceSignature?;

	

    public init(pointer: LDKInvoiceSignature){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func eq(a: InvoiceSignature, b: InvoiceSignature) -> Bool {
    	
        return withUnsafePointer(to: a.cOpaqueStruct!) { (aPointer: UnsafePointer<LDKInvoiceSignature>) in
withUnsafePointer(to: b.cOpaqueStruct!) { (bPointer: UnsafePointer<LDKInvoiceSignature>) in
InvoiceSignature_eq(aPointer, bPointer)
}
};
    }

    public func clone(orig: InvoiceSignature) -> InvoiceSignature {
    	
        return withUnsafePointer(to: orig.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKInvoiceSignature>) in
InvoiceSignature(pointer: InvoiceSignature_clone(origPointer))
};
    }

				
	deinit {
					if self.cOpaqueStruct?.is_owned == false {

					
					
		InvoiceSignature_free(self.cOpaqueStruct!)
					
}
				
	}
			
    /* STRUCT_METHODS_END */

}
