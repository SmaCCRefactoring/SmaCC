generated-reduction actions
reduceActionForexpression_statement1: nodes
	| result |
	result := CGLRExpressionStatementNode new.
	result semicolonToken: (nodes at: 1).
	^ result