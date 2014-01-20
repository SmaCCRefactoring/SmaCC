generated-reduction actions
reduceActionForSimpleTerm4: nodes
	^ (nodes at: 1)
		add: (grammar makeRepeatSymbolFor: (nodes at: 2));
		yourself