generated-reduction actions
reduceActionForempty_statement1: nodes
	| result |
	result := CSEmptyStatementNode new.
	result semicolonToken: (nodes at: 1).
	^ result