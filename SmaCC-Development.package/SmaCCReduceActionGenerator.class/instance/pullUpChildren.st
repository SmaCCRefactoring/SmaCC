reduction table
pullUpChildren
	currentSymbol returnsVariableCollection
		ifTrue: [ ^ self pullUpVariableArray ].
	currentSymbol returnsSingleVariable
		ifTrue: [ ^ self pullUpVariable ].
	currentSymbol modelType = (generator model classFor: nil class)
		ifFalse: [ rhs generateUnnamedSymbolWarningFor: currentIndex ]