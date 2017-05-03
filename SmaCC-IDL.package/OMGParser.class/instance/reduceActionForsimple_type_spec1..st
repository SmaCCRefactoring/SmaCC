generated-reduction actions
reduceActionForsimple_type_spec1: nodes
	| result |
	result := ASTSimpleTypeSpecNode new.
	result baseTypeSpec: (nodes at: 1).
	^ result