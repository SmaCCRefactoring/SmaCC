generated-reduction actions
reduceActionForExpressionStatement1: nodes
	| result |
	result := JSExpressionStatementNode new.
	result expression: (nodes at: 1).
	result semicolon: (nodes at: 2).
	^ result