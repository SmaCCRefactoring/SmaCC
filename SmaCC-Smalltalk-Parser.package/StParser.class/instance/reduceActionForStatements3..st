generated-reduction actions
reduceActionForStatements3: nodes
	^ (nodes at: 1)
		add: (RBReturnNode value: (nodes at: 4));
		yourself