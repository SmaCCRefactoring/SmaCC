generated-reduction actions
reduceActionForcatch_clause1: nodes
	| result |
	result := CSCatchClauseNode new.
	result catchToken: (nodes at: 1).
	result leftParenToken: ((nodes at: 2) at: 1).
	result type: ((nodes at: 2) at: 2).
	result name: ((nodes at: 2) at: 3).
	result rightParenToken: ((nodes at: 2) at: 4).
	result filter: (nodes at: 3).
	result block: (nodes at: 4).
	^ result