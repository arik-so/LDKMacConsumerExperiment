public class Result_QueryShortChannelIdsDecodeErrorZ {

    public internal(set) var cOpaqueStruct: LDKCResult_QueryShortChannelIdsDecodeErrorZ?;

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
        			self.cOpaqueStruct = LDKCResult_QueryShortChannelIdsDecodeErrorZ(contents: LDKCResult_QueryShortChannelIdsDecodeErrorZPtr(), result_ok: true)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_QueryShortChannelIdsDecodeErrorZ){
		self.cOpaqueStruct = pointer
	}

	public func isOk() -> Bool {
		return self.cOpaqueStruct?.result_ok == true
	}

    /* RESULT_METHODS_START */

			public func getError() -> DecodeError? {
				if self.cOpaqueStruct?.result_ok == false {
					return DecodeError(pointer: self.cOpaqueStruct!.contents.err.pointee)
				}
				return nil
			}
			
			public func getValue() -> QueryShortChannelIds? {
				if self.cOpaqueStruct?.result_ok == true {
					return QueryShortChannelIds(pointer: self.cOpaqueStruct!.contents.result.pointee)
				}
				return nil
			}
			
    /* RESULT_METHODS_END */

}
