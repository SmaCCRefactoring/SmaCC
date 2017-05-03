generated-reduction actions
reduceActionForparam_type_spec3: nodes
	| result |
	result := ASTParamTypeSpecNode new.
	result scopedName: (nodes at: 1).
	^ result