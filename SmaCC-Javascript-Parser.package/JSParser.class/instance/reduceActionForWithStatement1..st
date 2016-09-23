generated-reduction actions
reduceActionForWithStatement1: nodes
	| result |
	result := JSWithStatementNode new.
	result withToken: (nodes at: 1).
	result leftParen: (nodes at: 2).
	result expression: (nodes at: 3).
	result rightParen: (nodes at: 4).
	result statement: (nodes at: 5).
	^ result