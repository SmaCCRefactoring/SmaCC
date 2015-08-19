generated-reduction actions
reduceActionForeval_input1: nodes
	| result |
	result := PyEvalInputNode new.
	result addNodes: ((nodes at: 1) at: 1) to: result tests.
	result addTokens: ((nodes at: 1) at: 2) to: result commaTokens.
	result addTokens: (nodes at: 2) to: result nEWLINETokens.
	^ result