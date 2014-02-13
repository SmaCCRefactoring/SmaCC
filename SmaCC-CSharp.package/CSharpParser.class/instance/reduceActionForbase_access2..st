generated-reduction actions
reduceActionForbase_access2: nodes
	| result |
	result := CSBaseAccessNode new.
	result baseToken: (nodes at: 1).
	result leftBracketToken: (nodes at: 2).
	result addNodes: ((nodes at: 3) at: 1) to: result expressions.
	result addTokens: ((nodes at: 3) at: 2) to: result commaTokens.
	result rightBracketToken: (nodes at: 4).
	^ result