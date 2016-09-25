generated-reduction actions
reduceActionForRule1: nodes
	^ SmaCCRewrite
		comment: (nodes at: 1)
		match: (nodes at: 2)
		transformation: (nodes at: 4)