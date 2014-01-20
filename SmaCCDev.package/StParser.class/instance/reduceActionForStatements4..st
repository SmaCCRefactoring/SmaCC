generated-reduction actions
reduceActionForStatements4: nodes
	^ OrderedCollection with: (RBReturnNode value: (nodes at: 2))