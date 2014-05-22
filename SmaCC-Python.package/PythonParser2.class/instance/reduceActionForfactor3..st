generated-reduction actions
reduceActionForfactor3: nodes
	| result |
	result := PyFactorNode new.
	result minusToken: (nodes at: 1).
	result factor: (nodes at: 2).
	^ result