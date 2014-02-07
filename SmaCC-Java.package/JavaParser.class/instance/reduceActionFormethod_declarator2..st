generated
reduceActionFormethod_declarator2: nodes
	| result |
	result := JavaArrayMethodDeclaratorNode new.
	result declarator: (nodes at: 1).
	result left: (nodes at: 2).
	result right: (nodes at: 3).
	^result