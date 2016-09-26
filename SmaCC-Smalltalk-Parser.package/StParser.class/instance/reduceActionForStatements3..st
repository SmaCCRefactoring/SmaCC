generated-reduction actions
reduceActionForStatements3: nodes
	^ (nodes at: 2)
		add: (RBReturnNode value: (nodes at: 5));
		yourself