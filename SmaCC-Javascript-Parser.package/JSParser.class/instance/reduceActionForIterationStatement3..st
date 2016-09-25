generated-reduction actions
reduceActionForIterationStatement3: nodes
	| result |
	result := JSForStatementNode new.
	result forToken: (nodes at: 1).
	result leftParen: (nodes at: 2).
	result initialExpression: (nodes at: 3).
	result addToken: (nodes at: 4) to: result semicolons.
	result condition: (nodes at: 5).
	result addToken: (nodes at: 6) to: result semicolons.
	result iteratorExpression: (nodes at: 7).
	result rightParen: (nodes at: 8).
	result statement: (nodes at: 9).
	^ result