generated
reduceActionForlocal_variable_declarator1: nodes
	| result |
	result := CSLocalVariableDeclaratorNode new.
	result name: (nodes at: 1).
	^result