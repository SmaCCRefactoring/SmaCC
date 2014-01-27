generated
reduceActionForbreak_statement1: nodes
	| result |
	result := CSBreakStatementNode new.
	result breakToken: (nodes at: 1).
	result semicolonToken: (nodes at: 2).
	^result