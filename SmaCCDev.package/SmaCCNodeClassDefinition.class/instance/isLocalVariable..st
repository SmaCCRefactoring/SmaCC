private
isLocalVariable: aSmaCCVariableDefinition
	^superclass isNil or: [(superclass variableDefinitionNamed: aSmaCCVariableDefinition variableName) isNil]