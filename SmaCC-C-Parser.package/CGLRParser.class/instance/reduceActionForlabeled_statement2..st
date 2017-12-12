generated-reduction actions
reduceActionForlabeled_statement2: nodes
	| result |
	result := CGLRLabeledStatementNode new.
	result caseToken: (nodes at: 1).
	result case: (nodes at: 2).
	result colonToken: (nodes at: 3).
	result statement: (nodes at: 4).
	^ result