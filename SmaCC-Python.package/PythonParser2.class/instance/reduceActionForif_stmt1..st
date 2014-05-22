generated-reduction actions
reduceActionForif_stmt1: nodes
	| result |
	result := PyIfStmtNode new.
	result ifToken: (nodes at: 1).
	result if: (nodes at: 2).
	result colonToken: (nodes at: 3).
	result then: (nodes at: 4).
	result elsif: (nodes at: 5).
	result else: (nodes at: 6).
	^ result