generated-reduction actions
reduceActionForjump_statement4: nodes
	| result |
	result := CGLRReturnStatementNode new.
	result returnToken: (nodes at: 1).
	result semicolonToken: (nodes at: 2).
	^ result