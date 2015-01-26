generated-reduction actions
reduceActionForcomp_op8: nodes
	| result |
	result := PyCompOpNode new.
	result inToken: (nodes at: 1).
	^ result