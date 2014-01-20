generated-reduction actions
reduceActionForRegexRule2: nodes
	^ (nodes at: 2)
		addState: (nodes at: 1);
		yourself