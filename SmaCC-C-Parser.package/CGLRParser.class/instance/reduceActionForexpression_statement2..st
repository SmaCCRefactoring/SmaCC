generated-reduction actions
reduceActionForexpression_statement2: nodes
	| result |
	result := CGLRExpressionStatementNode new.
	result expression: (nodes at: 1).
	result semicolonToken: (nodes at: 2).
	^ result