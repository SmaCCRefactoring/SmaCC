generated
reduceActionFortry_statement3: nodes
	| result |
	result := CSTryStatementNode new.
	result tryToken: (nodes at: 1).
	result block: (nodes at: 2).
	result addNodes: ((nodes at: 3) at: 1) to: result clauses.
	result finally: (nodes at: 4).
	^result