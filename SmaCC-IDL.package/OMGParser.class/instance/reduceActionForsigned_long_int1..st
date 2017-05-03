generated-reduction actions
reduceActionForsigned_long_int1: nodes
	| result |
	result := ASTSignedLongIntNode new.
	result longToken: (nodes at: 1).
	^ result