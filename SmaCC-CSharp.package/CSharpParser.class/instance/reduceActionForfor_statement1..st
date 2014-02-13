generated-reduction actions
reduceActionForfor_statement1: nodes
	| result |
	result := CSForStatementNode new.
	result forToken: (nodes at: 1).
	result leftParenToken: (nodes at: 2).
	result initializer: ((nodes at: 3) at: 1).
	result addToken: (nodes at: 4) to: result semicolonTokens.
	result condition: ((nodes at: 5) at: 1).
	result addToken: (nodes at: 6) to: result semicolonTokens.
	result iterator: ((nodes at: 7) at: 1).
	result rightParenToken: (nodes at: 8).
	result statement: (nodes at: 9).
	^ result