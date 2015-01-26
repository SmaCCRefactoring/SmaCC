generated-reduction actions
reduceActionForfpdef2: nodes
	| result |
	result := PyFpdefNode new.
	result lparenToken: (nodes at: 1).
	result addNodes: ((nodes at: 2) at: 1) to: result fpdefs.
	result addTokens: ((nodes at: 2) at: 2) to: result commaTokens.
	result rparenToken: (nodes at: 3).
	^ result