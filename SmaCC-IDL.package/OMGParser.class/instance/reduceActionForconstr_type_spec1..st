generated-reduction actions
reduceActionForconstr_type_spec1: nodes
	| result |
	result := ASTConstrTypeSpecNode new.
	result structType: (nodes at: 1).
	^ result