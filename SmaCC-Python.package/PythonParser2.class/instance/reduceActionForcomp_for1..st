generated-reduction actions
reduceActionForcomp_for1: nodes
	| result |
	result := PyCompForNode new.
	result addToken: (nodes at: 1) to: result forTokens.
	result addObject: (nodes at: 2) to: result fors.
	result addToken: (nodes at: 3) to: result inTokens.
	^ result