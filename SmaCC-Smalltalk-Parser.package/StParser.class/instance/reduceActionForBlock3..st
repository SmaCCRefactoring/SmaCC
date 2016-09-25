generated-reduction actions
reduceActionForBlock3: nodes
	^ RBBlockNode
		arguments: (nodes at: 2)
		body: (RBSequenceNode statements: #())