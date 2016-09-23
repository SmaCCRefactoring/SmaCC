reduction table
assignVariable: variableName in: aSmaCCRHS at: key first: aBoolean
	| variableIndex value |
	variableIndex := aSmaCCRHS productionSymbol indexOfVariable: variableName.
	value := self argumentIndex: key.
	self
		nextPutStatement: ((aSmaCCRHS productionSymbol isCollection: variableName)
				ifTrue: 
					[self
						perform: (aBoolean
								ifTrue: [#addFirstSendTo:with:]
								ifFalse: [#addSendTo:with:])
						with: (self cast: (self at: 'result' index: variableIndex)
								to: self collectionType)
						with: value]
				ifFalse: [self assignArray: 'result' index: variableIndex to: value])