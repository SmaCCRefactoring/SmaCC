generated
reduceActionForempty_statement1: nodes
	| result |
	result := JavaEmptyStatementNode new.
	result semicolon: (nodes at: 1).
	^result