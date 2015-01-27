generated-reduction actions
reduceActionForcomp_for1: nodes
	| result |
	result := PyCompForNode new.
	result forToken: (nodes at: 1).
	result addNodes: ((nodes at: 2) at: 1) to: result exprs.
	result addTokens: ((nodes at: 2) at: 2) to: result commaTokens.
	result inToken: (nodes at: 3).
	result _in: (nodes at: 4).
	^ result