public class SpendableOutputDescriptor {

    public internal(set) var cOpaqueStruct: LDKSpendableOutputDescriptor?;

	

    public init(pointer: LDKSpendableOutputDescriptor){
		self.cOpaqueStruct = pointer
	}

    /* OPTION_METHODS_START */

				public enum SpendableOutputDescriptorValueType {
					case StaticOutput, DelayedPaymentOutput, StaticPaymentOutput
				}
				
				public func getValueType() -> SpendableOutputDescriptorValueType? {
					switch self.cOpaqueStruct?.tag {
                    
					case LDKSpendableOutputDescriptor_StaticOutput:
						return .StaticOutput
					case LDKSpendableOutputDescriptor_DelayedPaymentOutput:
						return .DelayedPaymentOutput
					case LDKSpendableOutputDescriptor_StaticPaymentOutput:
						return .StaticPaymentOutput
                    default:
                        return nil
                    }
				}
				
				
					public func getValueAsStaticOutput() -> StaticOutput? {
						if self.cOpaqueStruct?.tag != LDKSpendableOutputDescriptor_StaticOutput {
							return nil
						}
						return StaticOutput(pointer: self.cOpaqueStruct!.static_output)
					}
				
					public func getValueAsDelayedPaymentOutput() -> DelayedPaymentOutputDescriptor? {
						if self.cOpaqueStruct?.tag != LDKSpendableOutputDescriptor_DelayedPaymentOutput {
							return nil
						}
						return DelayedPaymentOutputDescriptor(pointer: self.cOpaqueStruct!.delayed_payment_output)
					}
				
					public func getValueAsStaticPaymentOutput() -> StaticPaymentOutputDescriptor? {
						if self.cOpaqueStruct?.tag != LDKSpendableOutputDescriptor_StaticPaymentOutput {
							return nil
						}
						return StaticPaymentOutputDescriptor(pointer: self.cOpaqueStruct!.static_payment_output)
					}
				
			
    /* OPTION_METHODS_END */

	

			public class StaticOutput {
				
				
				var cOpaqueStruct: LDKSpendableOutputDescriptor_LDKStaticOutput_Body?;
				fileprivate init(pointer: LDKSpendableOutputDescriptor_LDKStaticOutput_Body) {
					self.cOpaqueStruct = pointer
				}
			
				
				
					public func getOutpoint() -> OutPoint {
						return OutPoint(pointer: self.cOpaqueStruct!.outpoint)
					}
				
					public func getOutput() -> TxOut {
						return TxOut(pointer: self.cOpaqueStruct!.output)
					}
				
				
			}
		
}
