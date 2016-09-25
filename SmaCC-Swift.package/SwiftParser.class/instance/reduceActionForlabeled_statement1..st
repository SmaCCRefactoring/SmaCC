generated-reduction actions
reduceActionForlabeled_statement1: nodes
	| result |
	result := SwiftLabeledStatementNode new.
	result name: ((nodes at: 1) at: 1).
	result colonToken: ((nodes at: 1) at: 2).
	result statement: (nodes at: 2).
	^ result