generated-reduction actions
reduceActionForxor_expr2: nodes
	| result |
	result := ASTXorExprNode new.
	result xorExpr: (nodes at: 1).
	result upArrowToken: (nodes at: 2).
	result andExpr: (nodes at: 3).
	^ result