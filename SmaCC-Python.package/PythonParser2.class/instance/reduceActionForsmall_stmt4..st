generated-reduction actions
reduceActionForsmall_stmt4: nodes
	| result |
	result := ASTSStatementNode new.
	result passToken: ((nodes at: 1) at: 1).
	^ result