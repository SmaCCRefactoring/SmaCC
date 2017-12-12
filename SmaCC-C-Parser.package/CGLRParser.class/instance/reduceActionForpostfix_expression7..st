generated-reduction actions
reduceActionForpostfix_expression7: nodes
	| result |
	result := CGLRIncrementNode new.
	result object: (nodes at: 1).
	result plusPlusToken: (nodes at: 2).
	^ result