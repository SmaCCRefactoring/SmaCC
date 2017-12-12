generated-reduction actions
reduceActionForexpression2: nodes
	| result |
	result := nodes at: 1.
	result addToken: (nodes at: 2) to: result commaTokens.
	result addNode: (nodes at: 3) to: result expressions.
	^ result