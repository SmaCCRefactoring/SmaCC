initialize
hasVariableNamed: aString
	^newVariables anySatisfy: [:each | each variableName = aString]