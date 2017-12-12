generated-reduction actions
reduceActionForpostfix_expression5: nodes
	| result |
	result := CGLRPointNode new.
	result object: (nodes at: 1).
	result periodToken: (nodes at: 2).
	result member: (nodes at: 3).
	^ result