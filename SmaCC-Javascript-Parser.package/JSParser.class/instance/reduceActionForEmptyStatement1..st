generated-reduction actions
reduceActionForEmptyStatement1: nodes
	| result |
	result := JSEmptyStatementNode new.
	result semicolon: (nodes at: 1).
	^ result