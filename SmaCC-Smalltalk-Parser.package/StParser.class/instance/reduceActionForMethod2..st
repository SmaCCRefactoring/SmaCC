generated
reduceActionForMethod2: nodes
	^(RBMethodNode
		selector: (nodes at: 1) first
		arguments: (nodes at: 1) last
		body: (nodes at: 2) last) yourself