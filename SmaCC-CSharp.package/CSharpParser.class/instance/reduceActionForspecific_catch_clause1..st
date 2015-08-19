generated-reduction actions
reduceActionForspecific_catch_clause1: nodes
	| result |
	result := CSSpecificCatchClauseNode new.
	result catchToken: (nodes at: 1).
	result leftParenToken: (nodes at: 2).
	result type: (nodes at: 3).
	result _name: (nodes at: 4).
	result rightParenToken: (nodes at: 5).
	result block: (nodes at: 6).
	^ result