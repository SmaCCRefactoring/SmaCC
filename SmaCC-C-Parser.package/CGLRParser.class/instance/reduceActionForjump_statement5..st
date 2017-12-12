generated-reduction actions
reduceActionForjump_statement5: nodes
	| result |
	result := CGLRReturnStatementNode new.
	result returnToken: (nodes at: 1).
	result expr: (nodes at: 2).
	result semicolonToken: (nodes at: 3).
	^ result