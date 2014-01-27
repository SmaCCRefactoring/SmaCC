generated
reduceActionForlabeled_statement1: nodes
	| result |
	result := CSLabeledStatementNode new.
	result identifierToken: (nodes at: 1).
	result colonToken: (nodes at: 2).
	result statement: (nodes at: 3).
	^result