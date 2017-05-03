generated-reduction actions
reduceActionForconstr_type_spec3: nodes
	| result |
	result := ASTConstrTypeSpecNode new.
	result enumType: (nodes at: 1).
	^ result