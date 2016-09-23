generated-reduction actions
reduceActionForStatements3: nodes
	| result |
	result := nodes at: 1.
	self add: (nodes at: 2) to: (result at: 2).
	^ result