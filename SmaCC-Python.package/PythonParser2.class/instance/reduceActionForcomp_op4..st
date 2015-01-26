generated-reduction actions
reduceActionForcomp_op4: nodes
	| result |
	result := PyCompOpNode new.
	result greaterThanEqualToken: (nodes at: 1).
	^ result