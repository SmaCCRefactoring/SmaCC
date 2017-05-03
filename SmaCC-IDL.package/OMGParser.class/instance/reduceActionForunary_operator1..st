generated-reduction actions
reduceActionForunary_operator1: nodes
	| result |
	result := ASTUnaryOperatorNode new.
	result minusToken: (nodes at: 1).
	^ result