generated-reduction actions
reduceActionForatom10: nodes
	| result |
	result := PyNumberNode new.
	result numberToken: (nodes at: 1).
	^ result