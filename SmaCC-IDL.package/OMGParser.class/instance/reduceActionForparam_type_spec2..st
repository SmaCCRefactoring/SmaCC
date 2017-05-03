generated-reduction actions
reduceActionForparam_type_spec2: nodes
	| result |
	result := ASTParamTypeSpecNode new.
	result stringType: (nodes at: 1).
	^ result