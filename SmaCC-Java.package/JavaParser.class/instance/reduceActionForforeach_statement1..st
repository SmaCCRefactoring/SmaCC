generated
reduceActionForforeach_statement1: nodes
	| result |
	result := JavaForEachStatementNode new.
	result forToken: (nodes at: 1).
	result left: (nodes at: 2).
	result addNodes: ((nodes at: 3) at: 1) to: result modifiers.
	result type: (nodes at: 4).
	result colon: (nodes at: 6).
	result expression: (nodes at: 7).
	result right: (nodes at: 8).
	result statement: (nodes at: 9).
	^result