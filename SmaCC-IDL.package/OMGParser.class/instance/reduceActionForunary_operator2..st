generated-reduction actions
reduceActionForunary_operator2: nodes
	| result |
	result := ASTUnaryOperatorNode new.
	result plusToken: (nodes at: 1).
	^ result