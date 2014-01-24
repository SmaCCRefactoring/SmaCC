initialize
variableNamed: aString
	^newVariables
		detect: [:each | each variableName = aString]
		ifNone: [self addVariableNamed: aString]