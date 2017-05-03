generated-reduction actions
reduceActionForshift_expr2: nodes
	| result |
	result := ASTShiftExprNode new.
	result shiftExpr: (nodes at: 1).
	result greaterThanGreaterThanToken: (nodes at: 2).
	result addExpr: (nodes at: 3).
	^ result