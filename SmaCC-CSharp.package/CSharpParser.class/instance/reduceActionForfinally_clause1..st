generated-reduction actions
reduceActionForfinally_clause1: nodes
	| result |
	result := CSFinallyClauseNode new.
	result finallyToken: (nodes at: 1).
	result block: (nodes at: 2).
	^ result