generated-reduction actions
reduceActionForPropertyValues6: nodes
	| result |
	result := nodes at: 1.
	self add: (nodes at: 2) to: (result at: 5).
	^ result