generated-reduction actions
reduceActionForPropertyValues7: nodes
	| result |
	result := nodes at: 1.
	self add: (nodes at: 2) to: (result at: 6).
	^ result