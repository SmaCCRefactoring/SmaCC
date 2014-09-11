generated-reduction actions
reduceActionForexcept_clause2: nodes
	| result |
	result := PyExceptClauseNode new.
	result exceptToken: (nodes at: 1).
	result except: (nodes at: 2).
	^ result