generated-reduction actions
reduceActionForBlock4: nodes
	^ RBBlockNode
		arguments: (nodes at: 2)
		body: (RBSequenceNode temporaries: (nodes at: 4) statements: (nodes at: 6))