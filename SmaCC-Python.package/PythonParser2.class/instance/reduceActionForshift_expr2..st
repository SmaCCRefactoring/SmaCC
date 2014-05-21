generated-reduction actions
reduceActionForshift_expr2: nodes
	| result |
	result := ASTLShiftExprNode new.
	result one: (nodes at: 1).
	result lessThanLessThanToken: (nodes at: 2).
	result two: (nodes at: 3).
	^ result