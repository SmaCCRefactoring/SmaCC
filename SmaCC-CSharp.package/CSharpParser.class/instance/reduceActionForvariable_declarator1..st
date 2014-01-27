generated
reduceActionForvariable_declarator1: nodes
	| result |
	result := CSVariableDeclaratorNode new.
	result identifierToken: (nodes at: 1).
	^result