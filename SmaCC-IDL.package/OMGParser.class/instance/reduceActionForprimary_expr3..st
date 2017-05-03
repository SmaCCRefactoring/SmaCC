generated-reduction actions
reduceActionForprimary_expr3: nodes
	| result |
	result := ASTPrimaryExprNode new.
	result leftParenToken: (nodes at: 1).
	result constExp: (nodes at: 2).
	result rightParenToken: (nodes at: 3).
	^ result