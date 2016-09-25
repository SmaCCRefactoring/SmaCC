generated-reduction actions
reduceActionForIterationStatement5: nodes
	| result |
	result := JSForInStatementNode new.
	result forToken: (nodes at: 1).
	result leftParen: (nodes at: 2).
	result variable: (nodes at: 3).
	result inToken: (nodes at: 4).
	result expression: (nodes at: 5).
	result rightParen: (nodes at: 6).
	result statement: (nodes at: 7).
	^ result