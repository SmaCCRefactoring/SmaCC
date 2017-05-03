generated-reduction actions
reduceActionForliteral1: nodes
	| result |
	result := ASTLiteralNode new.
	result iNTEGER_LITERALToken: (nodes at: 1).
	^ result