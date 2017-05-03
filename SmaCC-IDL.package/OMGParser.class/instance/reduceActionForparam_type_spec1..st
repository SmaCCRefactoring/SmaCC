generated-reduction actions
reduceActionForparam_type_spec1: nodes
	| result |
	result := ASTParamTypeSpecNode new.
	result baseTypeSpec: (nodes at: 1).
	^ result