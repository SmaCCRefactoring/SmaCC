generated-reduction actions
reduceActionForLines2: nodes
	| result |
	result := nodes at: 1.
	self add: (nodes at: 3) to: result.
	^ result