private
pullUpChildren
	"Here we pull up. The type may be a variable or a node, and this is when we reach the node that it goes wrong."

	currentSymbol returnsVariableCollection
		ifTrue: [ ^ self pullUpVariableArray ].
	currentSymbol returnsSingleVariable
		ifTrue: [ ^ self pullUpVariable ].
	currentSymbol modelType = (generator model classFor: nil class)
		ifFalse: [ rhs generateUnnamedSymbolWarningFor: currentIndex ]