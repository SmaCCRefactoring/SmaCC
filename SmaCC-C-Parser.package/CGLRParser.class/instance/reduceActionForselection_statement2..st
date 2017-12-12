generated-reduction actions
reduceActionForselection_statement2: nodes
	| result |
	result := CGLRSelectionStatementNode new.
	result ifToken: (nodes at: 1).
	result leftParenToken: (nodes at: 2).
	result if: (nodes at: 3).
	result rightParenToken: (nodes at: 4).
	result then: (nodes at: 5).
	result elseToken: (nodes at: 6).
	result else: (nodes at: 7).
	^ result