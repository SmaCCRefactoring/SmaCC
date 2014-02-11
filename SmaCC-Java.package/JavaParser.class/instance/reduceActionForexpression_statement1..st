generated-reduction actions
reduceActionForexpression_statement1: nodes
	| result |
	result := JavaExpressionStatementNode new.
	result expression: (nodes at: 1).
	result semicolon: (nodes at: 2).
	^ result