generated-reduction actions
reduceActionForstmts1: nodes
	| result |
	result := nodes at: 1.
	result addNode: (nodes at: 2) to: result statements.
	^ result