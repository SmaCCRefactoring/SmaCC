generated-reduction actions
reduceActionForMethodVariables1: nodes
	| result |
	result := nodes at: 1.
	self add: (nodes at: 2) to: result.
	^ result