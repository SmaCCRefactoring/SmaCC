generated-reduction actions
reduceActionForTerms4: nodes
	^ (nodes at: 1)
		add: (grammar makeOptionalSymbolFor: (nodes at: 2));
		yourself