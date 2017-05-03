generated-reduction actions
reduceActionForunsigned_long_int1: nodes
	| result |
	result := ASTUnsignedLongIntNode new.
	result unsignedToken: (nodes at: 1).
	result longToken: (nodes at: 2).
	^ result