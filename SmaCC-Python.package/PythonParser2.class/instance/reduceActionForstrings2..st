generated-reduction actions
reduceActionForstrings2: nodes
	| result |
	result := ASTStringsNode new.
	result addToken: (nodes at: 1) to: result strings.
	^ result