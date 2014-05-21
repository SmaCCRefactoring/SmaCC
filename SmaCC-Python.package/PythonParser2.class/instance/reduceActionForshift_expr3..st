generated-reduction actions
reduceActionForshift_expr3: nodes
	| result |
	result := ASTRShiftExprNode new.
	result one: (nodes at: 1).
	result greaterThanGreaterThanToken: (nodes at: 2).
	result two: (nodes at: 3).
	^ result