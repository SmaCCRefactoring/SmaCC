private
pullUpVariableArray
	currentSymbol variableDefinitions
		keysAndValuesDo:
			[:subIndex :var | 
			generator
				nextPutStatement:
					(var isCollection
						ifTrue:
							[| collectionType |
							collectionType := generator collectionType.
							self
								compileAddToVariable: var
								from: (self getSubIndex: subIndex ofType: collectionType)
								collection: true]
						ifFalse:
							[| nodesVariable |
							nodesVariable := rhs nodeType variableDefinitionNamed: var variableName.
							nodesVariable isCollection
								ifTrue:
									[self
										compileAddToVariable: nodesVariable
										from: (self getSubIndex: subIndex ofType: nodesVariable type name)
										collection: false]
								ifFalse:
									[generator
										send: nodesVariable setterMethodName
										to: 'result'
										with: (generator cast: (generator argumentIndex: currentIndex subIndex: subIndex) to: nodesVariable type name)]])]