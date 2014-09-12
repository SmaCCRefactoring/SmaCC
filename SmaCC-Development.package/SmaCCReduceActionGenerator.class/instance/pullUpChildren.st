private
pullUpChildren
	"Here we pull up. The type may be a variable or a node, and this is when we reach the node that it goes wrong."

	currentSymbol returnsVariableCollection
		ifTrue: [ self pullUpVariableArray ]
		ifFalse: [ 
			currentSymbol isNode
				ifTrue: [ self pullUpNodeVariables ]
				ifFalse: [ 
					currentSymbol modelType = (generator model classFor: Object)
						ifTrue: [ self pullUpPotentialNodeVariables ] ] ]