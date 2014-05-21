generated-reduction actions
reduceActionForxor_expr2: nodes
	| result |
	result := ASTXorExprNode new.
	result one: (nodes at: 1).
	result upArrowToken: (nodes at: 2).
	result two: (nodes at: 3).
	^ result