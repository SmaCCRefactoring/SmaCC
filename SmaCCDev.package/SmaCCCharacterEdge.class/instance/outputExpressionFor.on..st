compiling
outputExpressionFor: aPair on: aStream 
	aPair first = aPair last 
		ifTrue: [^self outputMatchSingleCharacter: aPair first on: aStream].
	aPair first = (Character value: 0) 
		ifTrue: [^self outputMatchLessThan: aPair last on: aStream].
	aPair last = (Character value: SmaCCGrammar maximumCharacterValue) 
		ifTrue: [^self outputMatchGreaterThan: aPair first on: aStream].
	self outputMatchRange: aPair on: aStream