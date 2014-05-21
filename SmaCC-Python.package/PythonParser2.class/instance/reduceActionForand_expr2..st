generated-reduction actions
reduceActionForand_expr2: nodes
	| result |
	result := ASTAndExprNode new.
	result one: (nodes at: 1).
	result andToken: (nodes at: 2).
	result two: (nodes at: 3).
	^ result