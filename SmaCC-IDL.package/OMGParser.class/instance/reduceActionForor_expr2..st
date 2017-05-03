generated-reduction actions
reduceActionForor_expr2: nodes
	| result |
	result := ASTOrExprNode new.
	result orExpr: (nodes at: 1).
	result orToken: (nodes at: 2).
	result xorExpr: (nodes at: 3).
	^ result