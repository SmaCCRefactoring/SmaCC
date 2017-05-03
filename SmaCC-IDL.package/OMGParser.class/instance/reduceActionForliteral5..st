generated-reduction actions
reduceActionForliteral5: nodes
	| result |
	result := ASTLiteralNode new.
	result booleanLiteral: (nodes at: 1).
	^ result