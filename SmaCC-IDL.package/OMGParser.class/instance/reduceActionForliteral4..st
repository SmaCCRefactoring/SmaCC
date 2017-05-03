generated-reduction actions
reduceActionForliteral4: nodes
	| result |
	result := ASTLiteralNode new.
	result fLOATING_POINT_LITERALToken: (nodes at: 1).
	^ result