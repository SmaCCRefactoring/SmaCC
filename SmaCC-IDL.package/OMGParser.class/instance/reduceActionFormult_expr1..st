generated-reduction actions
reduceActionFormult_expr1: nodes
	| result |
	result := ASTMultExprNode new.
	result unaryExpr: (nodes at: 1).
	^ result