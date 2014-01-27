generated
reduceActionForfixed_statement1: nodes
	| result |
	result := CSFixedStatementNode new.
	result fixedToken: (nodes at: 1).
	result leftParenToken: (nodes at: 2).
	result type: (nodes at: 3).
	result addNodes: ((nodes at: 4) at: 1) to: result declarators.
	result addTokens: ((nodes at: 4) at: 2) to: result commaTokens.
	result rightParenToken: (nodes at: 5).
	result statement: (nodes at: 6).
	^result