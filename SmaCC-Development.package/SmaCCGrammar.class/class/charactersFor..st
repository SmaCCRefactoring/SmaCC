private
charactersFor: aSymbol
	| isExpressionMap |
	isExpressionMap := self isExpressionMap.
	^ isExpressionMap
		at: aSymbol
		ifAbsentPut: [ self generateCharacterSetFor: aSymbol ]