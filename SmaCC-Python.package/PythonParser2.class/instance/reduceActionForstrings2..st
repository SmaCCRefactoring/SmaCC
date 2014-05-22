generated-reduction actions
reduceActionForstrings2: nodes
	| result |
	result := PyStringsNode new.
	result addToken: (nodes at: 1) to: result strings.
	^ result