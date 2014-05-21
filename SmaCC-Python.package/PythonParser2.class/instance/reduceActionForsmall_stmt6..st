generated-reduction actions
reduceActionForsmall_stmt6: nodes
	| result |
	result := ASTSStatementNode new.
	result importToken: ((nodes at: 1) at: 1).
	result addTokens: ((nodes at: 1) at: 2) to: result commaTokens.
	result addTokens: ((nodes at: 1) at: 3) to: result periodTokens.
	result addTokens: ((nodes at: 1) at: 4) to: result nameTokens.
	result addTokens: ((nodes at: 1) at: 5) to: result asTokens.
	result fromToken: ((nodes at: 1) at: 6).
	result addToken: ((nodes at: 1) at: 7) to: result timesTokens.
	result addToken: ((nodes at: 1) at: 8) to: result lparenTokens.
	result addToken: ((nodes at: 1) at: 9) to: result rparenTokens.
	^ result