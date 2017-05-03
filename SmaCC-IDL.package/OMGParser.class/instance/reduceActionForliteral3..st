generated-reduction actions
reduceActionForliteral3: nodes
	| result |
	result := ASTLiteralNode new.
	result cHARACTER_LITERALToken: (nodes at: 1).
	^ result