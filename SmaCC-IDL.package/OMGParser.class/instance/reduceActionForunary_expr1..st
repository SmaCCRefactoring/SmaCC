generated-reduction actions
reduceActionForunary_expr1: nodes
	| result |
	result := ASTUnaryExprNode new.
	result unaryOperator: (nodes at: 1).
	result primaryExpr: (nodes at: 2).
	^ result