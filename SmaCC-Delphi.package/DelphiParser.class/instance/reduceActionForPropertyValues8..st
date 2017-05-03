generated-reduction actions
reduceActionForPropertyValues8: nodes
	| result |
	result := nodes at: 1.
	self add: (nodes at: 2) to: (result at: 7).
	^ result