generated-reduction actions
reduceActionFortrailer3: nodes
	| result |
	result := PyTrailerNode new.
	result lbrackToken: (nodes at: 1).
	result addObjects: ((nodes at: 2) at: 1) to: result subscripts.
	result addTokens: ((nodes at: 2) at: 2) to: result commaTokens.
	result rbrackToken: (nodes at: 3).
	^ result