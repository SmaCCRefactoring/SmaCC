generated-reduction actions
reduceActionForunary_expr2: nodes
	| result |
	result := ASTUnaryExprNode new.
	result primaryExpr: (nodes at: 1).
	^ result