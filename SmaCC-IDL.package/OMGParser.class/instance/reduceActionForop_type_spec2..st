generated-reduction actions
reduceActionForop_type_spec2: nodes
	| result |
	result := ASTOpTypeSpecNode new.
	result voidToken: (nodes at: 1).
	^ result