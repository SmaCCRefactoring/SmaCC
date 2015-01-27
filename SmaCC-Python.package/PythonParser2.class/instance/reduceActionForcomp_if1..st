generated-reduction actions
reduceActionForcomp_if1: nodes
	| result |
	result := PyCompIfNode new.
	result ifToken: (nodes at: 1).
	result condition: (nodes at: 2).
	^ result