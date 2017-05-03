generated-reduction actions
reduceActionForcomplex_declarator1: nodes
	| result |
	result := ASTComplexDeclaratorNode new.
	result arrayDeclarator: (nodes at: 1).
	^ result