generated-reduction actions
reduceActionForcontext_expr1: nodes
	| result |
	result := ASTContextExprNode new.
	result contextToken: (nodes at: 1).
	result leftParenToken: (nodes at: 2).
	result stringLiterals: (nodes at: 3).
	result rightParenToken: (nodes at: 4).
	^ result