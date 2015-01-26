generated-reduction actions
reduceActionForfor_stmt1: nodes
	| result |
	result := PyForNode new.
	result forToken: (nodes at: 1).
	result addNodes: ((nodes at: 2) at: 1) to: result exprs.
	result addTokens: ((nodes at: 2) at: 2) to: result commaTokens.
	result inToken: (nodes at: 3).
	result addToken: (nodes at: 5) to: result colonTokens.
	^ result