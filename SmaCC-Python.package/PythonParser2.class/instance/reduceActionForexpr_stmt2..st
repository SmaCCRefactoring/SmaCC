generated-reduction actions
reduceActionForexpr_stmt2: nodes
	| result |
	result := PyExprStmtNode new.
	result addNodes: ((nodes at: 1) at: 1) to: result tests.
	result addTokens: ((nodes at: 1) at: 2) to: result commaTokens.
	result addToken: (nodes at: 2) to: result assigns.
	result addObject: (nodes at: 3) to: result tos.
	^ result