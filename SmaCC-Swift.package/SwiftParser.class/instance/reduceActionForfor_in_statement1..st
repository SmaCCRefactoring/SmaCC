generated-reduction actions
reduceActionForfor_in_statement1: nodes
	| result |
	result := SwiftForInStatementNode new.
	result forToken: (nodes at: 1).
	result addTokens: ((nodes at: 2) at: 1) to: result _Tokens.
	result addTokens: ((nodes at: 2) at: 2) to: result colonTokens.
	result addTokens: ((nodes at: 2) at: 3) to: result identifierTokens.
	result addTokens: ((nodes at: 2) at: 4) to: result leftParenTokens.
	result addTokens: ((nodes at: 2) at: 5) to: result rightParenTokens.
	result addTokens: ((nodes at: 2) at: 6) to: result leftBracketTokens.
	result addTokens: ((nodes at: 2) at: 7) to: result rightBracketTokens.
	result addTokens: ((nodes at: 2) at: 8) to: result leftBraceTokens.
	result addTokens: ((nodes at: 2) at: 9) to: result rightBraceTokens.
	result
		addTokens: ((nodes at: 2) at: 10)
		to: result integer_literalTokens.
	result
		addTokens: ((nodes at: 2) at: 11)
		to: result floating_point_literalTokens.
	result addTokens: ((nodes at: 2) at: 12) to: result operatorTokens.
	result
		addTokens: ((nodes at: 2) at: 13)
		to: result full_string_literalTokens.
	result addTokens: ((nodes at: 2) at: 14) to: result periodTokens.
	result addTokens: ((nodes at: 2) at: 15) to: result protocolTokens.
	result addTokens: ((nodes at: 2) at: 16) to: result lessThanTokens.
	result addTokens: ((nodes at: 2) at: 17) to: result greaterThanTokens.
	result
		addTokens: ((nodes at: 2) at: 18)
		to: result minusGreaterThanTokens.
	result addTokens: ((nodes at: 2) at: 19) to: result commaTokens.
	result
		addTokens: ((nodes at: 2) at: 20)
		to: result questionMarkTokens.
	result addTokens: ((nodes at: 2) at: 21) to: result bangTokens.
	result addTokens: ((nodes at: 2) at: 22) to: result typeTokens.
	result
		addTokens: ((nodes at: 2) at: 23)
		to: result periodPeriodPeriodTokens.
	result addTokens: ((nodes at: 2) at: 24) to: result inoutTokens.
	result addTokens: ((nodes at: 2) at: 25) to: result varTokens.
	result addTokens: ((nodes at: 2) at: 26) to: result letTokens.
	result addObjects: ((nodes at: 2) at: 27) to: result expressions.
	result addTokens: ((nodes at: 2) at: 28) to: result isTokens.
	result addTokens: ((nodes at: 2) at: 29) to: result asTokens.
	result inToken: (nodes at: 3).
	result addObject: (nodes at: 4) to: result expressions.
	result block: (nodes at: 5).
	^ result