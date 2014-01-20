generated-reduction actions
reduceActionForSimpleTerm5: nodes
	^ (nodes at: 1)
		add: (grammar makeRepeatMultipleSymbolFor: (nodes at: 2));
		yourself