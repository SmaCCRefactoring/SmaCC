generated-reduction actions
reduceActionForpostfix_expression8: nodes
	| result |
	result := CGLRDecrementNode new.
	result object: (nodes at: 1).
	result minusMinusToken: (nodes at: 2).
	^ result