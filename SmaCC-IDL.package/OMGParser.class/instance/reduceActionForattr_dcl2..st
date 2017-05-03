generated-reduction actions
reduceActionForattr_dcl2: nodes
	| result |
	result := ASTAttrDclNode new.
	result readonlyToken: (nodes at: 1).
	result attributeToken: (nodes at: 2).
	result paramTypeSpec: (nodes at: 3).
	result simpleDeclarators: (nodes at: 4).
	^ result