private-variables
collectionVariableDefinitions
	^ self variableDefinitions select: [ :each | each isCollection ]