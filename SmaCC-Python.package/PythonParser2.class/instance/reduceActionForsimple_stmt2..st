generated-reduction actions
reduceActionForsimple_stmt2: nodes
	| result |
	result := PySimpleStmtNode new.
	result addNode: (nodes at: 1) to: result stmts.
	result addToken: ((nodes at: 2) at: 1) to: result semicolonTokens.
	result nEWLINEToken: (nodes at: 3).
	^ result