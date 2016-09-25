reduction table
pullUpVariableFrom: aSmaCCSymbol into: aSmaCCRHS index: anInteger first: aBoolean
	| variableValue rhsIndex variable |
	variable := aSmaCCSymbol variableDefinitions first.
	variableValue := self argumentIndex: anInteger.
	rhsIndex := aSmaCCRHS productionSymbol
				indexOfVariable: variable variableName.
	self
		nextPutStatement: ((aSmaCCRHS productionSymbol
				isCollection: variable variableName)
					ifTrue: 
						[| collectionValue |
						collectionValue := self cast: (self at: 'result' index: rhsIndex)
									to: self collectionType.
						(aSmaCCSymbol isCollection: variable variableName)
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
					ifFalse: [self assignArray: 'result' index: rhsIndex to: variableValue])