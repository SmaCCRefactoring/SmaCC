generated-reduction actions
reduceActionForpostfix_expression4: nodes
	| result |
	result := CGLRCallNode new.
	result f: (nodes at: 1).
	result leftParenToken: (nodes at: 2).
	result addNodes: ((nodes at: 3) at: 1) to: result arguments.
	result addTokens: ((nodes at: 3) at: 2) to: result commaTokens.
	result rightParenToken: (nodes at: 4).
	^ result