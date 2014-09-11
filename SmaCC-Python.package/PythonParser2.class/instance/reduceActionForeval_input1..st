generated-reduction actions
reduceActionForeval_input1: nodes
	| result |
	result := PyEvalInputNode new.
	result statement: (nodes at: 1).
	result addTokens: ((nodes at: 2) at: 1) to: result nEWLINETokens.
	^ result