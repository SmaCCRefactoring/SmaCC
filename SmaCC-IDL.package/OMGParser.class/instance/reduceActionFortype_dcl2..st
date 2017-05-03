generated-reduction actions
reduceActionFortype_dcl2: nodes
	| result |
	result := ASTTypeDclNode new.
	result structType: (nodes at: 1).
	^ result