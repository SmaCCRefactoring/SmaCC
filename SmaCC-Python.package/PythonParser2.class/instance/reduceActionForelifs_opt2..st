generated-reduction actions
reduceActionForelifs_opt2: nodes
	| result |
	result := PyElifNode new.
	result addToken: (nodes at: 2) to: result elifTokens.
	result addObject: (nodes at: 3) to: result elifs.
	result addToken: (nodes at: 4) to: result colonTokens.
	result addObject: (nodes at: 5) to: result thens.
	^ result