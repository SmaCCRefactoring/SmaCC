generated-reduction actions
reduceActionForexpr_stmt1: nodes
	| result |
	result := PyExprStmtNode new.
	result addNodes: ((nodes at: 1) at: 1) to: result tests.
	result addTokens: ((nodes at: 1) at: 2) to: result commaTokens.
	result addTokens: ((nodes at: 2) at: 1) to: result assigns.
	result addObjects: ((nodes at: 2) at: 2) to: result tos.
	^ result