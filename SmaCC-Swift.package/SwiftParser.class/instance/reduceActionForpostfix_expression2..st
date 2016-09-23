generated-reduction actions
reduceActionForpostfix_expression2: nodes
	| result |
	result := nodes at: 1.
	self add: (nodes at: 2) to: (result at: 36).
	^ result