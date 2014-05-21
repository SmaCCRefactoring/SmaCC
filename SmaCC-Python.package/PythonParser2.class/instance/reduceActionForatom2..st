generated-reduction actions
reduceActionForatom2: nodes
	| result |
	result := ASTAtomNode new.
	result lparenToken: (nodes at: 1).
	result list: (nodes at: 2).
	result rparenToken: (nodes at: 3).
	^ result