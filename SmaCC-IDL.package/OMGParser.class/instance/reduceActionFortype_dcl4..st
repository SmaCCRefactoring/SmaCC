generated-reduction actions
reduceActionFortype_dcl4: nodes
	| result |
	result := ASTTypeDclNode new.
	result enumType: (nodes at: 1).
	^ result