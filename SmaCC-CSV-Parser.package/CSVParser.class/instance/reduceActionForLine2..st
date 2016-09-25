generated-reduction actions
reduceActionForLine2: nodes
	| result |
	result := nodes at: 1.
	result addToken: (nodes at: 2) to: result commas.
	result addToken: (nodes at: 3) to: result values.
	^ result