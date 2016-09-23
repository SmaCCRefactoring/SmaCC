generated-reduction actions
reduceActionFortuple_type1: nodes
	| result |
	result := SwiftTupleTypeNode new.
	result addToken: (nodes at: 1) to: result leftParenTokens.
	result addTokens: ((nodes at: 2) at: 1) to: result _Tokens.
	result addTokens: ((nodes at: 2) at: 2) to: result identifierTokens.
	result addTokens: ((nodes at: 2) at: 3) to: result leftParenTokens.
	result addTokens: ((nodes at: 2) at: 4) to: result rightParenTokens.
	result addTokens: ((nodes at: 2) at: 5) to: result leftBracketTokens.
	result addTokens: ((nodes at: 2) at: 6) to: result rightBracketTokens.
	result addTokens: ((nodes at: 2) at: 7) to: result leftBraceTokens.
	result addTokens: ((nodes at: 2) at: 8) to: result rightBraceTokens.
	result
		addTokens: ((nodes at: 2) at: 9)
		to: result integer_literalTokens.
	result
		addTokens: ((nodes at: 2) at: 10)
		to: result floating_point_literalTokens.
	result addTokens: ((nodes at: 2) at: 11) to: result operatorTokens.
	result
		addTokens: ((nodes at: 2) at: 12)
		to: result full_string_literalTokens.
	result addTokens: ((nodes at: 2) at: 13) to: result inoutTokens.
	result addTokens: ((nodes at: 2) at: 14) to: result periodTokens.
	result addTokens: ((nodes at: 2) at: 15) to: result protocolTokens.
	result addTokens: ((nodes at: 2) at: 16) to: result lessThanTokens.
	result addTokens: ((nodes at: 2) at: 17) to: result greaterThanTokens.
	result addTokens: ((nodes at: 2) at: 18) to: result colonTokens.
	result
		addTokens: ((nodes at: 2) at: 19)
		to: result minusGreaterThanTokens.
	result addTokens: ((nodes at: 2) at: 20) to: result commaTokens.
	result
		addTokens: ((nodes at: 2) at: 21)
		to: result questionMarkTokens.
	result addTokens: ((nodes at: 2) at: 22) to: result bangTokens.
	result addTokens: ((nodes at: 2) at: 23) to: result typeTokens.
	result
		addTokens: ((nodes at: 2) at: 24)
		to: result periodPeriodPeriodTokens.
	result addToken: (nodes at: 3) to: result rightParenTokens.
	^ result