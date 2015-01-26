generated-reduction actions
reduceActionForcomp_op3: nodes
	| result |
	result := PyCompOpNode new.
	result equalEqualToken: (nodes at: 1).
	^ result