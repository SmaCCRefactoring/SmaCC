generated-reduction actions
reduceActionForand_expr1: nodes
	| result |
	result := ASTAndExprNode new.
	result shiftExpr: (nodes at: 1).
	^ result