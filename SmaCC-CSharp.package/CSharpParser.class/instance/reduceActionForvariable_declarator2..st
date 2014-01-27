generated
reduceActionForvariable_declarator2: nodes
	| result |
	result := CSVariableDeclaratorNode new.
	result identifierToken: (nodes at: 1).
	result equalToken: (nodes at: 2).
	result initializer: (nodes at: 3).
	^result