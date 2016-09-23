accessing-attributes
attributeNamed: aSymbol ifAbsent: aBlock
	^ self attributes at: aSymbol ifAbsent: aBlock