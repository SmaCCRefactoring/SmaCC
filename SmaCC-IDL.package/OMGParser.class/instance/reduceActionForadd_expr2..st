generated-reduction actions
reduceActionForadd_expr2: nodes
	| result |
	result := ASTAddExprNode new.
	result addExpr: (nodes at: 1).
	result plusToken: (nodes at: 2).
	result multExpr: (nodes at: 3).
	^ result