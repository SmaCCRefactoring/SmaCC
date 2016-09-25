accessing
attributeNamed: aSymbol put: aValue
	(attributes ifNil: [ attributes := Dictionary new ]) at: aSymbol put: aValue