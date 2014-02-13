generated-reduction actions
reduceActionForquery_expression1: nodes
	| result |
	result := CSQueryExpressionNode new.
	result addToken: ((nodes at: 1) at: 1) to: result fromTokens.
	result addNode: ((nodes at: 1) at: 2) to: result types.
	result addToken: ((nodes at: 1) at: 3) to: result identifierTokens.
	result addToken: ((nodes at: 1) at: 4) to: result inTokens.
	result addTokens: ((nodes at: 1) at: 5) to: result _leftParens.
	result addTokens: ((nodes at: 1) at: 6) to: result _rightParens.
	result addNode: ((nodes at: 1) at: 7) to: result lhses.
	result addToken: ((nodes at: 1) at: 8) to: result operators.
	result addNode: ((nodes at: 1) at: 9) to: result rhses.
	result addTokens: ((nodes at: 2) at: 1) to: result fromTokens.
	result addNodes: ((nodes at: 2) at: 2) to: result types.
	result addTokens: ((nodes at: 2) at: 3) to: result identifierTokens.
	result addTokens: ((nodes at: 2) at: 4) to: result inTokens.
	result addNodes: ((nodes at: 2) at: 5) to: result lhses.
	result addTokens: ((nodes at: 2) at: 6) to: result operators.
	result addNodes: ((nodes at: 2) at: 7) to: result rhses.
	result addTokens: ((nodes at: 2) at: 8) to: result letTokens.
	result addTokens: ((nodes at: 2) at: 9) to: result equalTokens.
	result addTokens: ((nodes at: 2) at: 10) to: result whereTokens.
	result addTokens: ((nodes at: 2) at: 11) to: result joinTokens.
	result addTokens: ((nodes at: 2) at: 12) to: result onTokens.
	result addTokens: ((nodes at: 2) at: 13) to: result equalsTokens.
	result addTokens: ((nodes at: 2) at: 14) to: result intoTokens.
	result addTokens: ((nodes at: 2) at: 15) to: result orderbyTokens.
	result addTokens: ((nodes at: 2) at: 16) to: result ascendingTokens.
	result addTokens: ((nodes at: 2) at: 17) to: result descendingTokens.
	result addTokens: ((nodes at: 2) at: 18) to: result commaTokens.
	result addTokens: ((nodes at: 2) at: 19) to: result selectTokens.
	result addTokens: ((nodes at: 2) at: 20) to: result _leftParens.
	result addTokens: ((nodes at: 2) at: 21) to: result _rightParens.
	result addTokens: ((nodes at: 2) at: 22) to: result groupTokens.
	result addTokens: ((nodes at: 2) at: 23) to: result byTokens.
	^ result