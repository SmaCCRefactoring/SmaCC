private
pullUpVariableFrom: aSmaCCSymbol into: aSmaCCRHS index: anInteger
	| variableValue rhsIndex variable |
	variable := aSmaCCSymbol variableDefinitions first.
	variableValue := self argumentIndex: anInteger.
	rhsIndex := aSmaCCRHS productionSymbol indexOfVariable: variable variableName.
	self
		nextPutStatement:
			((aSmaCCRHS productionSymbol isCollection: variable variableName)
				ifTrue: [ 
					| collectionValue |
					collectionValue := self cast: (self at: 'result' index: rhsIndex) to: self collectionType.
					(aSmaCCSymbol isCollection: variable variableName)
						ifTrue: [ self addAllSendTo: collectionValue with: (self cast: variableValue to: self collectionType) ]
						ifFalse: [ self addSendTo: collectionValue with: variableValue ] ]
				ifFalse: [ self assignArray: 'result' index: rhsIndex to: variableValue ])