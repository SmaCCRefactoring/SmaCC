generated-reduction actions
reduceActionForcomp_op5: nodes
	| result |
	result := PyCompOpNode new.
	result lessThanEqualToken: (nodes at: 1).
	^ result