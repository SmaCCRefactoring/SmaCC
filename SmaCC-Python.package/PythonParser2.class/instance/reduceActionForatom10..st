generated-reduction actions
reduceActionForatom10: nodes
	| result |
	result := ASTNumberNode new.
	result numberToken: (nodes at: 1).
	^ result