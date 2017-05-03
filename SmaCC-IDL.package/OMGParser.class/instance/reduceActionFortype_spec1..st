generated-reduction actions
reduceActionFortype_spec1: nodes
	| result |
	result := ASTTypeSpecNode new.
	result simpleTypeSpec: (nodes at: 1).
	^ result