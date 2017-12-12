generated-reduction actions
reduceActionForjump_statement1: nodes
	| result |
	result := CGLRGotoStatementNode new.
	result gotoToken: (nodes at: 1).
	result label: (nodes at: 2).
	result semicolonToken: (nodes at: 3).
	^ result