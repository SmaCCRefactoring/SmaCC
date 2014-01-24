private
collectionVariableDefinitions
	^self variableDefinitions select: [:each | each isCollection]