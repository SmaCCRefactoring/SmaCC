generated-reduction actions
reduceActionForpostfix_expression6: nodes
	| result |
	result := CGLRArrowNode new.
	result _pointer: (nodes at: 1).
	result minusGreaterThanToken: (nodes at: 2).
	result member: (nodes at: 3).
	^ result