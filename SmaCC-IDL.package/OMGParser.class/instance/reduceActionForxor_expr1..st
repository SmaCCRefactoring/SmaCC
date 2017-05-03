generated-reduction actions
reduceActionForxor_expr1: nodes
	| result |
	result := ASTXorExprNode new.
	result andExpr: (nodes at: 1).
	^ result