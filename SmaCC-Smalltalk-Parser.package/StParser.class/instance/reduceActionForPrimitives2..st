generated-reduction actions
reduceActionForPrimitives2: nodes
	^ (nodes at: 1)
		add: ((nodes at: 2) startPosition to: (nodes at: 4) startPosition);
		yourself