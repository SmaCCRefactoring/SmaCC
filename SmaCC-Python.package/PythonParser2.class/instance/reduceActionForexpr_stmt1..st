generated-reduction actions
reduceActionForexpr_stmt1: nodes
	| result |
	result := PyExprStmtNode new.
	result testlist: (nodes at: 1).
	result addTokens: ((nodes at: 2) at: 1) to: result assigns.
	result addObjects: ((nodes at: 2) at: 2) to: result tos.
	^ result