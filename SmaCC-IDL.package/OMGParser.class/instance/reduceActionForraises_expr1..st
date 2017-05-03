generated-reduction actions
reduceActionForraises_expr1: nodes
	| result |
	result := ASTRaisesExprNode new.
	result raisesToken: (nodes at: 1).
	result leftParenToken: (nodes at: 2).
	result scopedNames: (nodes at: 3).
	result rightParenToken: (nodes at: 4).
	^ result