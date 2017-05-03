generated-reduction actions
reduceActionForcase_label2: nodes
	| result |
	result := ASTCaseLabelNode new.
	result defaultToken: (nodes at: 1).
	result colonToken: (nodes at: 2).
	^ result