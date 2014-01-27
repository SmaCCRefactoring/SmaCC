generated
reduceActionForwhile_statement1: nodes
	| result |
	result := CSWhileStatementNode new.
	result whileToken: (nodes at: 1).
	result leftParenToken: (nodes at: 2).
	result expression: (nodes at: 3).
	result rightParenToken: (nodes at: 4).
	result statement: (nodes at: 5).
	^result