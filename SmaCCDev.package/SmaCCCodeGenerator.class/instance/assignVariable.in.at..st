private
assignVariable: variableName in: aSmaCCRHS at: key
	| variableIndex value |
	variableIndex := aSmaCCRHS productionSymbol indexOfVariable: variableName.
	value := self argumentIndex: key.
	self
		nextPutStatement:
			((aSmaCCRHS productionSymbol isCollection: variableName)
				ifTrue: [self addSendTo: (self cast: (self at: 'result' index: variableIndex) to: self collectionType) with: value]
				ifFalse:
					[self
						assignArray: 'result'
						index: variableIndex
						to: value])