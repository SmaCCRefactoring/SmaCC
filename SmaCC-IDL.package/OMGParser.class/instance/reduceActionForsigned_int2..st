generated-reduction actions
reduceActionForsigned_int2: nodes
	| result |
	result := ASTSignedIntNode new.
	result signedShortInt: (nodes at: 1).
	^ result