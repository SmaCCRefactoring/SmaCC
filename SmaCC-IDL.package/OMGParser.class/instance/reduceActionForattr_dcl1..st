generated-reduction actions
reduceActionForattr_dcl1: nodes
	| result |
	result := ASTAttrDclNode new.
	result attributeToken: (nodes at: 1).
	result paramTypeSpec: (nodes at: 2).
	result simpleDeclarators: (nodes at: 3).
	^ result