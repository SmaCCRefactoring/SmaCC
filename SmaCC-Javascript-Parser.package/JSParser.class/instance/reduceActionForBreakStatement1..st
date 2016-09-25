generated-reduction actions
reduceActionForBreakStatement1: nodes
	| result |
	result := JSBreakStatementNode new.
	result breakToken: (nodes at: 1).
	result label: (nodes at: 2).
	result semicolon: (nodes at: 3).
	^ result