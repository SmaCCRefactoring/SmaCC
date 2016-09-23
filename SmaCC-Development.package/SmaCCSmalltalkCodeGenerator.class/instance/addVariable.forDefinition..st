compiling
addVariable: aSmaCCVariableDefinition forDefinition: aSmaCCNodeClassDefinition
	"When creating an instance variable, check that we don't have one to delete first."

	| instVarName |
	instVarName := self nonKeywordNameFor: aSmaCCVariableDefinition sourceVariableName.
	(aSmaCCNodeClassDefinition modelClass definesInstanceVariable: instVarName)
		ifTrue: [ 
			self model changes changes
				do: [ :each | 
					((each isKindOf: RBRemoveInstanceVariableChange)
						and: [ each changeClassName = aSmaCCNodeClassDefinition modelClass name and: [ each variable = instVarName ] ])
						ifTrue: [ 
							self removeChange: each.
							^ self ] ] ].
	aSmaCCNodeClassDefinition modelClass addInstanceVariable: instVarName