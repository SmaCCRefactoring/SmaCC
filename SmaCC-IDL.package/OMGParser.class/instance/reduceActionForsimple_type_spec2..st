generated-reduction actions
reduceActionForsimple_type_spec2: nodes
	| result |
	result := ASTSimpleTypeSpecNode new.
	result templateTypeSpec: (nodes at: 1).
	^ result