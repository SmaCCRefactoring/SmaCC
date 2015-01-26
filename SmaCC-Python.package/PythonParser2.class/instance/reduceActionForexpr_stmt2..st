generated-reduction actions
reduceActionForexpr_stmt2: nodes
	| result |
	result := PyExprStmtNode new.
	result testlist: (nodes at: 1).
	result addToken: (nodes at: 2) to: result assigns.
	result addNode: (nodes at: 3) to: result tos.
	^ result