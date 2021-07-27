open class Filter {

    public var cOpaqueStruct: LDKFilter?;

    public init() {

    	/* NATIVE_CALLBACKS_START */

		func register_txCallback(pointer: UnsafeRawPointer?, txidPointer: UnsafePointer<(UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8)>?, script_pubkey: LDKu8slice) -> Void {
			let instance: Filter = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "Filter.swift::register_tx")
			
								var txid: [UInt8]? = nil
								if let txidUnwrapped = txidPointer {
									txid = Bindings.tuple32_to_array(nativeType: txidUnwrapped.pointee)
								}
							
			return instance.register_tx(txid: txid, script_pubkey: Bindings.LDKu8slice_to_array(nativeType: script_pubkey));
		}

		func register_outputCallback(pointer: UnsafeRawPointer?, output: LDKWatchedOutput) -> LDKCOption_C2Tuple_usizeTransactionZZ {
			let instance: Filter = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "Filter.swift::register_output")
			
			return instance.register_output(output: WatchedOutput(pointer: output)).cOpaqueStruct!;
		}

		func freeCallback(pointer: UnsafeMutableRawPointer?) -> Void {
			let instance: Filter = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "Filter.swift::free")
			
			return instance.free();
		}

		/* NATIVE_CALLBACKS_END */

        self.cOpaqueStruct = LDKFilter(this_arg: Bindings.instanceToPointer(instance: self), 
			register_tx: register_txCallback,
			register_output: register_outputCallback,
			free: freeCallback)
    }

    public init(pointer: LDKFilter){
		self.cOpaqueStruct = pointer
	}

    /* SWIFT_CALLBACKS_START */

    open func register_tx(txid: [UInt8]?, script_pubkey: [UInt8]) -> Void {
    	/* EDIT ME */
		
    }

    open func register_output(output: WatchedOutput) -> Option_C2Tuple_usizeTransactionZZ {
    	/* EDIT ME */
		return Option_C2Tuple_usizeTransactionZZ(pointer: LDKCOption_C2Tuple_usizeTransactionZZ())
    }

    open func free() -> Void {
    	/* EDIT ME */
		
    }

    /* SWIFT_CALLBACKS_END */

}


public class NativelyImplementedFilter: Filter {
	/* SWIFT_DEFAULT_CALLBACKS_START */

	public override func register_tx(txid: [UInt8]?, script_pubkey: [UInt8]) -> Void {
		
				withUnsafePointer(to: Bindings.array_to_tuple32(array: txid!)) { (txidPointer: UnsafePointer<(UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8)>) in

				self.cOpaqueStruct!.register_tx(self.cOpaqueStruct!.this_arg, txidPointer, Bindings.new_LDKu8slice(array: script_pubkey))
				
}
			
	}

	public override func register_output(output: WatchedOutput) -> Option_C2Tuple_usizeTransactionZZ {
		
				return 
				Option_C2Tuple_usizeTransactionZZ(pointer: self.cOpaqueStruct!.register_output(self.cOpaqueStruct!.this_arg, output.cOpaqueStruct!))
				
			
	}

	public override func free() -> Void {
		
				
				self.cOpaqueStruct!.free(self.cOpaqueStruct!.this_arg)
				
			
	}

	/* SWIFT_DEFAULT_CALLBACKS_END */
}
