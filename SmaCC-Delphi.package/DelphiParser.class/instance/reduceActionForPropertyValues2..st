generated-reduction actions
reduceActionForPropertyValues2: nodes
	| result |
	result := nodes at: 1.
	self add: (nodes at: 2) to: (result at: 1).
	^ result