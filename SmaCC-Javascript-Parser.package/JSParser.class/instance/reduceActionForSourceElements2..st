generated-reduction actions
reduceActionForSourceElements2: nodes
	| result |
	result := nodes at: 1.
	self add: (nodes at: 2) to: result.
	^ result