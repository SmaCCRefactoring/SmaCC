generated-reduction actions
reduceActionFortype_declarator1: nodes
	| result |
	result := ASTTypeDeclaratorNode new.
	result typeSpec: (nodes at: 1).
	result declarators: (nodes at: 2).
	^ result