generated-reduction actions
reduceActionForcomp_op7: nodes
	| result |
	result := PyCompOpNode new.
	result bangEqualToken: (nodes at: 1).
	^ result