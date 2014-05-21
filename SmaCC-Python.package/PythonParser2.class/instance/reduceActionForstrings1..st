generated-reduction actions
reduceActionForstrings1: nodes
	| result |
	result := nodes at: 2.
	result addFirstToken: (nodes at: 1) to: result strings.
	^ result