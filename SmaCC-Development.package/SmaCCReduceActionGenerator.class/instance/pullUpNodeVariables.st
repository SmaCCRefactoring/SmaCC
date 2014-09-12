private
pullUpNodeVariables
	"Ok. This is probably a code we want to avoid."

	currentSymbol nodeType allVariableDefinitions notEmpty
		ifTrue: [ self error: 'AST definition is probably incorrect' ].
	currentSymbol nodeType allVariableDefinitions
		do: [ :var | 
			| receiver declaration |
			declaration := rhs nodeType variableDefinitionNamed: var variableName.
			receiver := generator
				cast: (generator argumentIndex: currentIndex)
				to: (rhs collection at: currentIndex) modelType name.
			generator
				nextPutStatement:
					(declaration isCollection
						ifTrue: [ 
							self
								compileAddToVariable: var
								from: (generator send: (rhs nodeType variableDefinitionNamed: var variableName) getterMethodName to: receiver)
								collection: var isCollection ]
						ifFalse: [ 
							generator
								send: declaration setterMethodName
								to: 'result'
								with: (generator send: declaration getterMethodName to: receiver) ]) ]