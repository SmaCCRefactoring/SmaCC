generated-reduction actions
reduceActionForbase_type_spec4: nodes
	| result |
	result := ASTBaseTypeSpecNode new.
	result booleanType: (nodes at: 1).
	^ result