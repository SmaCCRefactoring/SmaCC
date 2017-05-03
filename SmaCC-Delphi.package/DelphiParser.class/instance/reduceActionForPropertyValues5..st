generated-reduction actions
reduceActionForPropertyValues5: nodes
	| result |
	result := nodes at: 1.
	self add: (nodes at: 2) to: (result at: 4).
	^ result