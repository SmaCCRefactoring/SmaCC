generated
reduceActionForfor_statement1: nodes
	| result |
	result := JavaForStatementNode new.
	result forToken: (nodes at: 1).
	result left: (nodes at: 2).
	result initial: (nodes at: 3).
	result firstSemicolon: (nodes at: 4).
	result test: (nodes at: 5).
	result secondSemicolon: (nodes at: 6).
	result _update: (nodes at: 7).
	result right: (nodes at: 8).
	result statement: (nodes at: 9).
	^result