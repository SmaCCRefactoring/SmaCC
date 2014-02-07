generated
reduceActionFortry_statement2: nodes
	| result |
	result := JavaTryStatementNode new.
	result tryToken: (nodes at: 1).
	result block: (nodes at: 2).
	result addNodes: ((nodes at: 3) at: 1) to: result catches.
	result finally: (nodes at: 4).
	^result