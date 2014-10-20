generated-reduction actions
reduceActionForcatch_clause1: nodes
	| result |
	result := JavaCatchClauseNode new.
	result catchToken: (nodes at: 1).
	result left: (nodes at: 2).
	result parameter: (nodes at: 3).
	result right: (nodes at: 4).
	result block: (nodes at: 5).
	^ result