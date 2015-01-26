generated-reduction actions
reduceActionForcomp_op9: nodes
	| result |
	result := PyCompOpNode new.
	result notToken: (nodes at: 1).
	result inToken: (nodes at: 2).
	^ result