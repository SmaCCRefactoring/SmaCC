variables
variableDefinitions
	^ variableDefinitions ifNil: [ self computeVariableDefinitions ]