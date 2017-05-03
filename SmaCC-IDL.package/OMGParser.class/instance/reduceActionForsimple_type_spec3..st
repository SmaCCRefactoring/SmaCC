generated-reduction actions
reduceActionForsimple_type_spec3: nodes
	| result |
	result := ASTSimpleTypeSpecNode new.
	result scopedName: (nodes at: 1).
	^ result