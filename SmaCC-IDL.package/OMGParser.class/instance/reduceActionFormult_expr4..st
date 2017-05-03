generated-reduction actions
reduceActionFormult_expr4: nodes
	| result |
	result := ASTMultExprNode new.
	result multExpr: (nodes at: 1).
	result percentToken: (nodes at: 2).
	result unaryExpr: (nodes at: 3).
	^ result