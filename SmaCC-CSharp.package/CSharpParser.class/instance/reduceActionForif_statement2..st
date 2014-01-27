generated
reduceActionForif_statement2: nodes
	| result |
	result := CSIfStatementNode new.
	result ifToken: (nodes at: 1).
	result leftParenToken: (nodes at: 2).
	result expression: (nodes at: 3).
	result rightParenToken: (nodes at: 4).
	result thenStatement: (nodes at: 5).
	result elseToken: (nodes at: 6).
	result elseStatement: (nodes at: 7).
	^result