private
hasSingleVariableName: aSymbol
	^ self
		hasSingleVariableName: aSymbol
		using: Set new
		seen: IdentitySet new