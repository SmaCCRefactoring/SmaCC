generated-reduction actions
reduceActionForbase_type_spec3: nodes
	| result |
	result := ASTBaseTypeSpecNode new.
	result charType: (nodes at: 1).
	^ result