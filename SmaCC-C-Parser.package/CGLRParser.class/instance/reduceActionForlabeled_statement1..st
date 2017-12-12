generated-reduction actions
reduceActionForlabeled_statement1: nodes
	| result |
	result := CGLRLabeledStatementNode new.
	result label: (nodes at: 1).
	result colonToken: (nodes at: 2).
	result statement: (nodes at: 3).
	^ result