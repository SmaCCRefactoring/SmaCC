generated-reduction actions
reduceActionForfactor4: nodes
	| result |
	result := PyFactorNode new.
	result tildeToken: (nodes at: 1).
	result factor: (nodes at: 2).
	^ result