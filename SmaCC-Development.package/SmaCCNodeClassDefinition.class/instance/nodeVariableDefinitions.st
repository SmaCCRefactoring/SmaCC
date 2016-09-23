accessing
nodeVariableDefinitions
	^ self variableDefinitions
		select: [ :each | each isBasePossibleNodeType ]