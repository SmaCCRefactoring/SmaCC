generated-reduction actions
reduceActionForClassList2: nodes
	^ (nodes at: 1)
		add: (nodes at: 2) value asSymbol;
		yourself