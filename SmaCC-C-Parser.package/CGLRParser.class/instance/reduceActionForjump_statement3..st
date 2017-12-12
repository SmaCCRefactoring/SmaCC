generated-reduction actions
reduceActionForjump_statement3: nodes
	| result |
	result := CGLRBreakStatementNode new.
	result breakToken: (nodes at: 1).
	result semicolonToken: (nodes at: 2).
	^ result