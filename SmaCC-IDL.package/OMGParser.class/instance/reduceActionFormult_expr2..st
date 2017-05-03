generated-reduction actions
reduceActionFormult_expr2: nodes
	| result |
	result := ASTMultExprNode new.
	result multExpr: (nodes at: 1).
	result timesToken: (nodes at: 2).
	result unaryExpr: (nodes at: 3).
	^ result