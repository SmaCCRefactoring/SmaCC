generated-reduction actions
reduceActionForunsafe_statement1: nodes
	| result |
	result := CSUnsafeStatementNode new.
	result unsafeToken: (nodes at: 1).
	result block: (nodes at: 2).
	^ result