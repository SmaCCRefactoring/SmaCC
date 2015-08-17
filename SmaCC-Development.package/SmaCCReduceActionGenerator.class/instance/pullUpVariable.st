reduction table
pullUpVariable
	currentSymbol variableDefinitions
		keysAndValuesDo: [ :subIndex :var | 
			generator
				nextPutStatement:
					(var isCollection
						ifTrue: [ 
							self
								compileAddToVariable: var
								from: (generator cast: (generator argumentIndex: currentIndex) to: generator collectionType)
								collection: true ]
						ifFalse: [ 
							| nodesVariable |
							nodesVariable := rhs nodeType variableDefinitionNamed: var variableName.
							nodesVariable isCollection
								ifTrue: [ 
									self
										compileAddToVariable: nodesVariable
										from: (generator cast: (generator argumentIndex: currentIndex) to: nodesVariable type name)
										collection: false ]
								ifFalse: [ 
									generator
										send: nodesVariable setterMethodName
										to: 'result'
										with: (generator cast: (generator argumentIndex: currentIndex) to: nodesVariable type name) ] ]) ]