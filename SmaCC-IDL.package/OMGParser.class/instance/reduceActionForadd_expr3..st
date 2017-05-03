generated-reduction actions
reduceActionForadd_expr3: nodes
	| result |
	result := ASTAddExprNode new.
	result addExpr: (nodes at: 1).
	result minusToken: (nodes at: 2).
	result multExpr: (nodes at: 3).
	^ result