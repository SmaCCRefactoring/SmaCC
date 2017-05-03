generated-reduction actions
reduceActionForbase_type_spec2: nodes
	| result |
	result := ASTBaseTypeSpecNode new.
	result integerType: (nodes at: 1).
	^ result