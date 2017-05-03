generated-reduction actions
reduceActionForbase_type_spec1: nodes
	| result |
	result := ASTBaseTypeSpecNode new.
	result floatingPtType: (nodes at: 1).
	^ result