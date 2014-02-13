generated-reduction actions
reduceActionForexpression_statement1: nodes
	| result |
	result := CSExpressionStatementNode new.
	result expression: (nodes at: 1).
	result semicolonToken: (nodes at: 2).
	^ result