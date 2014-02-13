generated-reduction actions
reduceActionForgeneral_catch_clause1: nodes
	| result |
	result := CSGeneralCatchClauseNode new.
	result catchToken: (nodes at: 1).
	result block: (nodes at: 2).
	^ result