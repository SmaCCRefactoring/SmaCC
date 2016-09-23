generated-reduction actions
reduceActionForfor_statement1: nodes
	| result |
	result := SwiftForStatementNode new.
	result forToken: (nodes at: 1).
	result addObjects: ((nodes at: 2) at: 1) to: result expressions.
	result addTokens: ((nodes at: 2) at: 2) to: result commaTokens.
	result semicolonToken: (nodes at: 3).
	result testExpression: (nodes at: 4).
	result semicolonToken: (nodes at: 5).
	result incrementExpression: (nodes at: 6).
	result block: (nodes at: 7).
	^ result