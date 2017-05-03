generated-reduction actions
reduceActionForadd_expr1: nodes
	| result |
	result := ASTAddExprNode new.
	result multExpr: (nodes at: 1).
	^ result