generated-reduction actions
reduceActionFortype_spec2: nodes
	| result |
	result := ASTTypeSpecNode new.
	result constrTypeSpec: (nodes at: 1).
	^ result