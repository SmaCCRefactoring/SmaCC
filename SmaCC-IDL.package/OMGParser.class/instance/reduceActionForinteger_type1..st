generated-reduction actions
reduceActionForinteger_type1: nodes
	| result |
	result := ASTIntegerTypeNode new.
	result signedInt: (nodes at: 1).
	^ result