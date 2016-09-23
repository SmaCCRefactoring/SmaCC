accessing
tokenNamed: aString ifAbsentPut: aBlock
	^ tokens at: aString ifAbsentPut: aBlock