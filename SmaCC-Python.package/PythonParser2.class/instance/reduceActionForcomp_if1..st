generated-reduction actions
reduceActionForcomp_if1: nodes
	| result |
	result := PyCompIfNode new.
	result addToken: (nodes at: 1) to: result ifTokens.
	result addNode: (nodes at: 2) to: result conditions.
	^ result