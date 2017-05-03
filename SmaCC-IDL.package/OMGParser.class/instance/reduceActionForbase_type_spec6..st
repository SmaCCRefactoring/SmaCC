generated-reduction actions
reduceActionForbase_type_spec6: nodes
	| result |
	result := ASTBaseTypeSpecNode new.
	result anyType: (nodes at: 1).
	^ result