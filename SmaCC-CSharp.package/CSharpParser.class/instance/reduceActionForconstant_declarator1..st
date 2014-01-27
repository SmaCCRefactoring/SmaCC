generated
reduceActionForconstant_declarator1: nodes
	| result |
	result := CSConstantDeclaratorNode new.
	result identifierToken: (nodes at: 1).
	result equalToken: (nodes at: 2).
	result expression: (nodes at: 3).
	^result