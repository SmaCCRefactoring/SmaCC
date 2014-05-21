generated-reduction actions
reduceActionForatom9: nodes
	| result |
	result := ASTSymbolNode new.
	result nameToken: (nodes at: 1).
	^ result