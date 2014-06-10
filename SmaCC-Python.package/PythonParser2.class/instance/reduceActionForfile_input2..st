generated-reduction actions
reduceActionForfile_input2: nodes
	| result |
	result := nodes at: 1.
	result addToken: (nodes at: 2) to: result nEWLINETokens.
	^ result