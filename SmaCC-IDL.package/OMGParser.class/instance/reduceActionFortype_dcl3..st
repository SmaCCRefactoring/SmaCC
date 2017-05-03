generated-reduction actions
reduceActionFortype_dcl3: nodes
	| result |
	result := ASTTypeDclNode new.
	result unionType: (nodes at: 1).
	^ result