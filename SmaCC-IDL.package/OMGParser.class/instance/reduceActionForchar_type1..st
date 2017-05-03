generated-reduction actions
reduceActionForchar_type1: nodes
	| result |
	result := ASTCharTypeNode new.
	result charToken: (nodes at: 1).
	^ result