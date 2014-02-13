generated-reduction actions
reduceActionForunchecked_statement1: nodes
	| result |
	result := CSUncheckedStatementNode new.
	result uncheckedToken: (nodes at: 1).
	result block: (nodes at: 2).
	^ result