private
pullUpChildren
	currentSymbol returnsVariableCollection
		ifTrue: [self pullUpVariableArray]
		ifFalse:
			[currentSymbol isNode
				ifTrue: [self pullUpNodeVariables]
				ifFalse: [currentSymbol modelType = (generator model classFor: Object) ifTrue: [self pullUpPotentialNodeVariables]]]