generated-reduction actions
reduceActionForlabeled_statement3: nodes
	| result |
	result := CGLRLabeledStatementNode new.
	result case: (nodes at: 1).
	result colonToken: (nodes at: 2).
	result statement: (nodes at: 3).
	^ result