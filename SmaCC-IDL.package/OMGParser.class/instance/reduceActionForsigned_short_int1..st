generated-reduction actions
reduceActionForsigned_short_int1: nodes
	| result |
	result := ASTSignedShortIntNode new.
	result shortToken: (nodes at: 1).
	^ result