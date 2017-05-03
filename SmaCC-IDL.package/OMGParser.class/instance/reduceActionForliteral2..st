generated-reduction actions
reduceActionForliteral2: nodes
	| result |
	result := ASTLiteralNode new.
	result sTRING_LITERALToken: (nodes at: 1).
	^ result