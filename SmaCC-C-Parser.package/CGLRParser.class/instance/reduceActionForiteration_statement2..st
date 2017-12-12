generated-reduction actions
reduceActionForiteration_statement2: nodes
	| result |
	result := CGLRDoStatementNode new.
	result doToken: (nodes at: 1).
	result statement: (nodes at: 2).
	result whileToken: (nodes at: 3).
	result leftParenToken: (nodes at: 4).
	result while: (nodes at: 5).
	result rightParenToken: (nodes at: 6).
	result semicolonToken: (nodes at: 7).
	^ result