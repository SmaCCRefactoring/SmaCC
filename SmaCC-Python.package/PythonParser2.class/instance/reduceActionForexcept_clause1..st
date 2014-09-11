generated-reduction actions
reduceActionForexcept_clause1: nodes
	| result |
	result := PyExceptClauseNode new.
	result exceptToken: (nodes at: 1).
	^ result