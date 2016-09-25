variables
hasVariableNamed: aString
	^ self variableDefinitions
		anySatisfy: [ :each | each variableName = aString ]