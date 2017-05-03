generated-reduction actions
reduceActionForPropertyValues4: nodes
	| result |
	result := nodes at: 1.
	self add: (nodes at: 2) to: (result at: 3).
	^ result