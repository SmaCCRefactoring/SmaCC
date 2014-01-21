accessing
instanceVariableNames
	^self variableDefinitions collect: [:each | each variableName]