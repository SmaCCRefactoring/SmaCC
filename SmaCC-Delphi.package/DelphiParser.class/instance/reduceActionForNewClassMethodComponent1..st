generated-reduction actions
reduceActionForNewClassMethodComponent1: nodes
	| result |
	result := nodes at: 2.
	result attribute: (nodes at: 1).
	^ result