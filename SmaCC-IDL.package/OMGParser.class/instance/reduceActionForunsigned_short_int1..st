generated-reduction actions
reduceActionForunsigned_short_int1: nodes
	| result |
	result := ASTUnsignedShortIntNode new.
	result unsignedToken: (nodes at: 1).
	result shortToken: (nodes at: 2).
	^ result