generated-reduction actions
reduceActionForfor_statement2: nodes
	| result |
	result := SwiftForStatementNode new.
	result forToken: (nodes at: 1).
	result leftParenToken: (nodes at: 2).
	result addObjects: ((nodes at: 3) at: 1) to: result expressions.
	result addTokens: ((nodes at: 3) at: 2) to: result commaTokens.
	result semicolonToken: (nodes at: 4).
	result testExpression: (nodes at: 5).
	result semicolonToken: (nodes at: 6).
	result incrementExpression: (nodes at: 7).
	result rightParenToken: (nodes at: 8).
	result block: (nodes at: 9).
	^ result