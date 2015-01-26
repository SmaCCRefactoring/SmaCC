generated-reduction actions
reduceActionForsliceop2: nodes
	| result |
	result := PySliceopNode new.
	result colonToken: (nodes at: 1).
	^ result