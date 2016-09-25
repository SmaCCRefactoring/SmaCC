accessing
attributeNamed: aSymbol
	^attributes ifNil: [ nil ] ifNotNil: [ attributes at: aSymbol ]