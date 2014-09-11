generated-reduction actions
reduceActionFortrailer4: nodes
	| result |
	result := PyTrailerNode new.
	result periodToken: (nodes at: 1).
	result nameToken: (nodes at: 2).
	^ result