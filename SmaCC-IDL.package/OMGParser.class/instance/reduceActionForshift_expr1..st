generated-reduction actions
reduceActionForshift_expr1: nodes
	| result |
	result := ASTShiftExprNode new.
	result addExpr: (nodes at: 1).
	^ result