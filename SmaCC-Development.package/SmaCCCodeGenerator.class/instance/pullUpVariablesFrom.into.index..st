private
pullUpVariablesFrom: aSmaCCSymbol into: aSmaCCRHS index: anInteger
	aSmaCCSymbol variableDefinitions
		do:
			[:each | 
			| variableValue rhsIndex |
			variableValue := self argumentIndex: anInteger subIndex: (aSmaCCSymbol indexOfVariable: each variableName).
			rhsIndex := aSmaCCRHS productionSymbol indexOfVariable: each variableName.
			self
				nextPutStatement:
					((aSmaCCRHS productionSymbol isCollection: each variableName)
						ifTrue:
							[| collectionValue |
							collectionValue := self cast: (self at: 'result' index: rhsIndex) to: self collectionType.
							(aSmaCCSymbol isCollection: each variableName)
								ifTrue: [self addAllSendTo: collectionValue with: (self cast: variableValue to: self collectionType)]
								ifFalse: [self addSendTo: collectionValue with: variableValue]]
						ifFalse:
							[self
								assignArray: 'result'
								index: rhsIndex
								to: variableValue])]