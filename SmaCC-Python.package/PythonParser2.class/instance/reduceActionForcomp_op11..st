generated-reduction actions
reduceActionForcomp_op11: nodes
	| result |
	result := PyCompOpNode new.
	result isToken: (nodes at: 1).
	result notToken: (nodes at: 2).
	^ result