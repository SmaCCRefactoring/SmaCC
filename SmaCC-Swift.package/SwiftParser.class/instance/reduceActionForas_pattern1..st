generated-reduction actions
reduceActionForas_pattern1: nodes
	| result |
	result := nodes at: 1.
	self add: (nodes at: 2) to: (result at: 29).
	^ result