initialize
calculateNewVariables
	ourType := currentRHS nodeType.
	newVariables := OrderedCollection new.
	previousVariables := #().
	currentRHS
		variablesAndSymbolsDo: [ :variable :symbol | 
			variable isNil
				ifTrue: [ self processUnnamedSymbol: symbol ]
				ifFalse: [ 
					symbol returnsSingleVariable
						ifTrue: [ self addRenamedVariableName: variable from: symbol ]
						ifFalse: [ self addLocallyDefinedVariable: variable ] ].
			previousVariables := newVariables collect: [ :each | each variableName ] ]