accessing
attributeNamed: aSymbol ifAbsentPut: aBlock
	^ self attributes at: aSymbol ifAbsentPut: aBlock