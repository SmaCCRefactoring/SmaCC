generated-reduction actions
reduceActionForTerms8: nodes
	^ (nodes at: 1)
		add: (grammar makeRepeatMultipleSymbolFor: (nodes at: 2));
		yourself