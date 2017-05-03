generated-reduction actions
reduceActionForunsigned_int2: nodes
	| result |
	result := ASTUnsignedIntNode new.
	result unsignedShortInt: (nodes at: 1).
	^ result