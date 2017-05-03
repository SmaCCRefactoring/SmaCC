generated-reduction actions
reduceActionForunary_operator3: nodes
	| result |
	result := ASTUnaryOperatorNode new.
	result tildeToken: (nodes at: 1).
	^ result