generated-reduction actions
reduceActionForunsigned_int1: nodes
	| result |
	result := ASTUnsignedIntNode new.
	result unsignedLongInt: (nodes at: 1).
	^ result