generated-reduction actions
reduceActionForcomp_op1: nodes
	| result |
	result := PyCompOpNode new.
	result lessThanToken: (nodes at: 1).
	^ result