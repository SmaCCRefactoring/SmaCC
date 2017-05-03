generated-reduction actions
reduceActionFortype_dcl1: nodes
	| result |
	result := ASTTypeDclNode new.
	result typedefToken: (nodes at: 1).
	result typeDeclarator: (nodes at: 2).
	^ result