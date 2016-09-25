generated-reduction actions
reduceActionForIterationStatement4: nodes
	| result |
	result := JSForStatementNode new.
	result forToken: (nodes at: 1).
	result leftParen: (nodes at: 2).
	result varToken: (nodes at: 3).
	result addNodes: ((nodes at: 4) at: 1) to: result variables.
	result addTokens: ((nodes at: 4) at: 2) to: result commas.
	result addToken: (nodes at: 5) to: result semicolons.
	result condition: (nodes at: 6).
	result addToken: (nodes at: 7) to: result semicolons.
	result iteratorExpression: (nodes at: 8).
	result rightParen: (nodes at: 9).
	result statement: (nodes at: 10).
	^ result