generated-reduction actions
reduceActionForMethodSequenceNode3: nodes
	^ Array
		with: (nodes at: 1)
		with: (RBSequenceNode temporaries: #() statements: (nodes at: 2))