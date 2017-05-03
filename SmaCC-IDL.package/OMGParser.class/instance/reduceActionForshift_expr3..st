generated-reduction actions
reduceActionForshift_expr3: nodes
	| result |
	result := ASTShiftExprNode new.
	result shiftExpr: (nodes at: 1).
	result lessThanLessThanToken: (nodes at: 2).
	result addExpr: (nodes at: 3).
	^ result