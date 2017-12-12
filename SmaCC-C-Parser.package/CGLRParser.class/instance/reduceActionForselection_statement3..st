generated-reduction actions
reduceActionForselection_statement3: nodes
	| result |
	result := CGLRSwitchStatementNode new.
	result switchToken: (nodes at: 1).
	result leftParenToken: (nodes at: 2).
	result if: (nodes at: 3).
	result rightParenToken: (nodes at: 4).
	result statement: (nodes at: 5).
	^ result