generated-reduction actions
reduceActionForatom1: nodes
	| result |
	result := ASTAtomNode new.
	result lparenToken: (nodes at: 1).
	result rparenToken: (nodes at: 2).
	^ result