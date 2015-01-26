generated-reduction actions
reduceActionForcomp_op6: nodes
	| result |
	result := PyCompOpNode new.
	result lessThanGreaterThanToken: (nodes at: 1).
	^ result