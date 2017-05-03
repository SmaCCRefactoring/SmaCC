generated-reduction actions
reduceActionForboolean_type1: nodes
	| result |
	result := ASTBooleanTypeNode new.
	result booleanToken: (nodes at: 1).
	^ result