generated-reduction actions
reduceActionForsmall_stmt7: nodes
	| result |
	result := ASTSStatementNode new.
	result globalToken: ((nodes at: 1) at: 1).
	result addTokens: ((nodes at: 1) at: 2) to: result commaTokens.
	result addTokens: ((nodes at: 1) at: 3) to: result nameTokens.
	^ result