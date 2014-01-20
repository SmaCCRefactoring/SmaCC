generated-reduction actions
reduceActionForSimpleTerm3: nodes
	^ (nodes at: 1)
		add: (grammar makeOptionalSymbolFor: (nodes at: 2));
		yourself