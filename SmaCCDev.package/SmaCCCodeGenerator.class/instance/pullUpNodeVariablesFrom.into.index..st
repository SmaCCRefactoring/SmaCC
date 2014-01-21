private
pullUpNodeVariablesFrom: aSmaCCSymbol into: aSmaCCRHS index: anInteger
	aSmaCCSymbol nodeType
		ifNotNil:
			[:value | 
			aSmaCCSymbol variableDefinitions
				do:
					[:each | 
					| collectionGetter variableGetter variableIndex |
					variableIndex := aSmaCCRHS productionSymbol indexOfVariable: each variableName.
					collectionGetter := value collectionGetterForVariableName: each variableName.
					variableGetter := value objectGetterForVariableName: each variableName.
					self
						nextPutStatement:
							((aSmaCCRHS productionSymbol isCollection: each variableName)
								ifTrue:
									[self
										addAllSendTo: (self cast: (self at: 'result' index: variableIndex) to: self collectionType)
										with:
											(self
												collectionVariableItemsIn: (self argumentIndex: anInteger)
												forCollectionGetter: collectionGetter
												andVariableGetter: variableGetter)]
								ifFalse:
									[self
										assignArray: 'result'
										index: variableIndex
										to: (self variableItemIn: (self argumentIndex: anInteger) forVariableGetter: variableGetter)])]]