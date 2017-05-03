generated-reduction actions
reduceActionForconstr_type_spec2: nodes
	| result |
	result := ASTConstrTypeSpecNode new.
	result unionType: (nodes at: 1).
	^ result