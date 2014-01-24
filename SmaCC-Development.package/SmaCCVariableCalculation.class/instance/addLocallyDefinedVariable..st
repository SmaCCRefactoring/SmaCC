initialize
addLocallyDefinedVariable: aString
	(self hasVariableNamed: aString)
		ifTrue: [(self variableNamed: aString) isCollection: true]
		ifFalse: [self addVariableNamed: aString]