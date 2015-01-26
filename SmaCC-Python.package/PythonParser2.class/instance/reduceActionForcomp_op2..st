generated-reduction actions
reduceActionForcomp_op2: nodes
	| result |
	result := PyCompOpNode new.
	result greaterThanToken: (nodes at: 1).
	^ result