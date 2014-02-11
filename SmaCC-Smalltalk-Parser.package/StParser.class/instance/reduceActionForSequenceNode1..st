generated-reduction actions
reduceActionForSequenceNode1: nodes
	^ RBSequenceNode temporaries: (nodes at: 1) statements: (nodes at: 2)