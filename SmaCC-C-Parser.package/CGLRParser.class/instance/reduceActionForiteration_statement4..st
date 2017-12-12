generated-reduction actions
reduceActionForiteration_statement4: nodes
	| result |
	result := CGLRForStatementNode new.
	result forToken: (nodes at: 1).
	result leftParenToken: (nodes at: 2).
	result init: (nodes at: 3).
	result until: (nodes at: 4).
	result step: (nodes at: 5).
	result rightParenToken: (nodes at: 6).
	result statement: (nodes at: 7).
	^ result