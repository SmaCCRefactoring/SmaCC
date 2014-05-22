generated-reduction actions
reduceActionForfactor2: nodes
	| result |
	result := PyFactorNode new.
	result plusToken: (nodes at: 1).
	result factor: (nodes at: 2).
	^ result