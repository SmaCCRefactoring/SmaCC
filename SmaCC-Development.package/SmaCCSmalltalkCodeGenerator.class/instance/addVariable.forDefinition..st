compiling
addVariable: aSmaCCVariableDefinition forDefinition: aSmaCCNodeClassDefinition
	| instVarName |
	instVarName := self
		nonKeywordNameFor: aSmaCCVariableDefinition sourceVariableName.
	(aSmaCCNodeClassDefinition modelClass
		definesInstanceVariable: instVarName)
		ifTrue: [ ^ self ].
	aSmaCCNodeClassDefinition modelClass addInstanceVariable: instVarName