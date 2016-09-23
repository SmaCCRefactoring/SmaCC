reduction table
pullUpVariablesFrom: aSmaCCSymbol into: aSmaCCRHS index: anInteger first: aBoolean
	aSmaCCSymbol variableDefinitions do: 
			[:each |
			| variableValue rhsIndex |
			variableValue := self argumentIndex: anInteger
						subIndex: (aSmaCCSymbol indexOfVariable: each variableName).
			rhsIndex := aSmaCCRHS productionSymbol indexOfVariable: each variableName.
			self
				nextPutStatement: ((aSmaCCRHS productionSymbol
						isCollection: each variableName)
							ifTrue: 
								[| collectionValue |
								collectionValue := self cast: (self at: 'result' index: rhsIndex)
											to: self collectionType.
								(aSmaCCSymbol isCollection: each variableName)
									ifTrue: 
										[self
											perform: (aBoolean
													ifTrue: [#addAllFirstSendTo:with:]
													ifFalse: [#addAllSendTo:with:])
											with: collectionValue
											with: (self cast: variableValue to: self collectionType)]
									ifFalse: 
										[self
											perform: (aBoolean
													ifTrue: [#addFirstSendTo:with:]
													ifFalse: [#addSendTo:with:])
											with: collectionValue
											with: variableValue]]
							ifFalse: [self assignArray: 'result' index: rhsIndex to: variableValue])]