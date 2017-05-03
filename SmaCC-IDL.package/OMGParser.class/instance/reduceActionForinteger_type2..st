generated-reduction actions
reduceActionForinteger_type2: nodes
	| result |
	result := ASTIntegerTypeNode new.
	result unsignedInt: (nodes at: 1).
	^ result