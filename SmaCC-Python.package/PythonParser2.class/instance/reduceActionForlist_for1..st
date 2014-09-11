generated-reduction actions
reduceActionForlist_for1: nodes
	| result |
	result := PyListForNode new.
	result addToken: (nodes at: 1) to: result forTokens.
	result addObject: (nodes at: 2) to: result fors.
	result addToken: (nodes at: 3) to: result inTokens.
	result addNodes: ((nodes at: 4) at: 1) to: result tests.
	result addTokens: ((nodes at: 4) at: 2) to: result commaTokens.
	^ result