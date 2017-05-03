generated-reduction actions
reduceActionForany_type1: nodes
	| result |
	result := ASTAnyTypeNode new.
	result anyToken: (nodes at: 1).
	^ result