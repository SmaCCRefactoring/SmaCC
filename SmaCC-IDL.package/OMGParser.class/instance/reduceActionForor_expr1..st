generated-reduction actions
reduceActionForor_expr1: nodes
	| result |
	result := ASTOrExprNode new.
	result xorExpr: (nodes at: 1).
	^ result