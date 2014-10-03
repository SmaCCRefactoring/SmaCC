private
generate: aSmaCCRHS pullUp: anInteger on: aCodeGenerator
	rhs := aSmaCCRHS.
	index := anInteger.
	generator := aCodeGenerator.
	rhs collection
		keysAndValuesDo: [ :i :each | 
			currentIndex := i.
			currentSymbol := each.
			index ~= currentIndex
				ifTrue: [ 
					variableName := rhs variableNameForIndex: currentIndex.
					variableName notNil
						ifTrue: [ 
							currentSymbol returnsVariableCollection
								ifTrue: [ rhs generateNamedVariableCollectionWarningFor: currentIndex ].
							generator nextPutStatement: self connectChild ]
						ifFalse: [ self pullUpChildren ] ] ]