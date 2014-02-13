generated-reduction actions
reduceActionFortry_statement1: nodes
	| result |
	result := CSTryStatementNode new.
	result tryToken: (nodes at: 1).
	result block: (nodes at: 2).
	result addNodes: ((nodes at: 3) at: 1) to: result clauses.
	^ result