generated-reduction actions
reduceActionForjump_statement2: nodes
	| result |
	result := CGLRContinueStatementNode new.
	result continueToken: (nodes at: 1).
	result semicolonToken: (nodes at: 2).
	^ result