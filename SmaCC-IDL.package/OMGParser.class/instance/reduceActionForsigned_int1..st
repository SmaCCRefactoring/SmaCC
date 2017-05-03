generated-reduction actions
reduceActionForsigned_int1: nodes
	| result |
	result := ASTSignedIntNode new.
	result signedLongInt: (nodes at: 1).
	^ result