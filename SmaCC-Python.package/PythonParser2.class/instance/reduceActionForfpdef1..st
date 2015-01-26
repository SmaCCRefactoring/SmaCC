generated-reduction actions
reduceActionForfpdef1: nodes
	| result |
	result := PyFpdefNode new.
	result nameToken: (nodes at: 1).
	^ result