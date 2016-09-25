generated-reduction actions
reduceActionForswitch_statement1: nodes
	| result |
	result := SwiftSwitchStatementNode new.
	result switchToken: (nodes at: 1).
	result addObject: (nodes at: 2) to: result expressions.
	result addToken: (nodes at: 3) to: result leftBraceTokens.
	result addTokens: ((nodes at: 4) at: 1) to: result caseTokens.
	result addTokens: ((nodes at: 4) at: 2) to: result _Tokens.
	result addTokens: ((nodes at: 4) at: 3) to: result colonTokens.
	result addTokens: ((nodes at: 4) at: 4) to: result identifierTokens.
	result addTokens: ((nodes at: 4) at: 5) to: result leftParenTokens.
	result addTokens: ((nodes at: 4) at: 6) to: result rightParenTokens.
	result addTokens: ((nodes at: 4) at: 7) to: result leftBracketTokens.
	result addTokens: ((nodes at: 4) at: 8) to: result rightBracketTokens.
	result addTokens: ((nodes at: 4) at: 9) to: result leftBraceTokens.
	result addTokens: ((nodes at: 4) at: 10) to: result rightBraceTokens.
	result
		addTokens: ((nodes at: 4) at: 11)
		to: result integer_literalTokens.
	result
		addTokens: ((nodes at: 4) at: 12)
		to: result floating_point_literalTokens.
	result addTokens: ((nodes at: 4) at: 13) to: result operatorTokens.
	result
		addTokens: ((nodes at: 4) at: 14)
		to: result full_string_literalTokens.
	result addTokens: ((nodes at: 4) at: 15) to: result periodTokens.
	result addTokens: ((nodes at: 4) at: 16) to: result protocolTokens.
	result addTokens: ((nodes at: 4) at: 17) to: result lessThanTokens.
	result addTokens: ((nodes at: 4) at: 18) to: result greaterThanTokens.
	result
		addTokens: ((nodes at: 4) at: 19)
		to: result minusGreaterThanTokens.
	result addTokens: ((nodes at: 4) at: 20) to: result commaTokens.
	result
		addTokens: ((nodes at: 4) at: 21)
		to: result questionMarkTokens.
	result addTokens: ((nodes at: 4) at: 22) to: result bangTokens.
	result addTokens: ((nodes at: 4) at: 23) to: result typeTokens.
	result
		addTokens: ((nodes at: 4) at: 24)
		to: result periodPeriodPeriodTokens.
	result addTokens: ((nodes at: 4) at: 25) to: result inoutTokens.
	result addTokens: ((nodes at: 4) at: 26) to: result varTokens.
	result addTokens: ((nodes at: 4) at: 27) to: result letTokens.
	result addObjects: ((nodes at: 4) at: 28) to: result expressions.
	result addTokens: ((nodes at: 4) at: 29) to: result isTokens.
	result addTokens: ((nodes at: 4) at: 30) to: result asTokens.
	result addTokens: ((nodes at: 4) at: 31) to: result whereTokens.
	result addNodes: ((nodes at: 4) at: 32) to: result statements.
	result addTokens: ((nodes at: 4) at: 33) to: result semicolonToken.
	result addTokens: ((nodes at: 4) at: 34) to: result defaultTokens.
	result addToken: (nodes at: 5) to: result rightBraceTokens.
	^ result