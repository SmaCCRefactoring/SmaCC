generated-reduction actions
reduceActionForcase_label1: nodes
	| result |
	result := ASTCaseLabelNode new.
	result caseToken: (nodes at: 1).
	result constExp: (nodes at: 2).
	result colonToken: (nodes at: 3).
	^ result