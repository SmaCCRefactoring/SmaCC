generated-reduction actions
reduceActionForcomp_op10: nodes
	| result |
	result := PyCompOpNode new.
	result isToken: (nodes at: 1).
	^ result