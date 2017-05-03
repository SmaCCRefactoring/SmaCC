generated-reduction actions
reduceActionForop_type_spec1: nodes
	| result |
	result := ASTOpTypeSpecNode new.
	result paramTypeSpec: (nodes at: 1).
	^ result