generated-reduction actions
reduceActionForTerms9: nodes
	^ (nodes at: 1)
		add: (grammar makeRepeatMultipleSymbolFor: (nodes at: 2));
		nameLastItem:
			((nodes at: 3) value copyFrom: 2 to:
				(nodes at: 3) value size - 1);
		yourself