generated
reduceActionForvariable_declarator1: nodes
	| result |
	result := JavaVariableDeclarationNode new.
	result variable: (nodes at: 1).
	^result