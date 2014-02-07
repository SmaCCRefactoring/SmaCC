generated
reduceActionFortry_statement1: nodes
	| result |
	result := JavaTryStatementNode new.
	result tryToken: (nodes at: 1).
	result block: (nodes at: 2).
	result addNodes: ((nodes at: 3) at: 1) to: result catches.
	^result