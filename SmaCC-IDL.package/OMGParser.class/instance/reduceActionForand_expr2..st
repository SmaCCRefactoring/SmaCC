generated-reduction actions
reduceActionForand_expr2: nodes
	| result |
	result := ASTAndExprNode new.
	result andExpr: (nodes at: 1).
	result andToken: (nodes at: 2).
	result shiftExpr: (nodes at: 3).
	^ result