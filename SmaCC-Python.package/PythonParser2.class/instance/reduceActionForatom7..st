generated-reduction actions
reduceActionForatom7: nodes
	| result |
	result := ASTAtomNode new.
	result lcurlyToken: (nodes at: 1).
	result rcurlyToken: (nodes at: 2).
	^ result