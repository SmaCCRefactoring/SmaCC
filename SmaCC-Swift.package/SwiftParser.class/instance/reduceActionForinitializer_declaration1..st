generated-reduction actions
reduceActionForinitializer_declaration1: nodes
	| result |
	result := SwiftInitializerDeclarationNode new.
	result addTokens: ((nodes at: 1) at: 1) to: result _Tokens.
	result addTokens: ((nodes at: 1) at: 2) to: result identifierTokens.
	result addTokens: ((nodes at: 1) at: 3) to: result leftParenTokens.
	result addTokens: ((nodes at: 1) at: 4) to: result rightParenTokens.
	result addTokens: ((nodes at: 1) at: 5) to: result leftBracketTokens.
	result addTokens: ((nodes at: 1) at: 6) to: result rightBracketTokens.
	result addTokens: ((nodes at: 1) at: 7) to: result leftBraceTokens.
	result addTokens: ((nodes at: 1) at: 8) to: result rightBraceTokens.
	result
		addTokens: ((nodes at: 1) at: 9)
		to: result integer_literalTokens.
	result
		addTokens: ((nodes at: 1) at: 10)
		to: result floating_point_literalTokens.
	result addTokens: ((nodes at: 1) at: 11) to: result operatorTokens.
	result
		addTokens: ((nodes at: 1) at: 12)
		to: result full_string_literalTokens.
	result convenienceToken: ((nodes at: 1) at: 13).
	result initToken: ((nodes at: 1) at: 14).
	result addTokens: ((nodes at: 2) at: 1) to: result lessThanTokens.
	result addTokens: ((nodes at: 2) at: 2) to: result identifierTokens.
	result addTokens: ((nodes at: 2) at: 3) to: result colonTokens.
	result addTokens: ((nodes at: 2) at: 4) to: result commaTokens.
	result addTokens: ((nodes at: 2) at: 5) to: result greaterThanTokens.
	result addTokens: ((nodes at: 2) at: 6) to: result periodTokens.
	result addTokens: ((nodes at: 2) at: 7) to: result protocolTokens.
	result whereToken: ((nodes at: 2) at: 8).
	result addTokens: ((nodes at: 2) at: 9) to: result equalEqualTokens.
	result addTokens: ((nodes at: 3) at: 1) to: result leftParenTokens.
	result addTokens: ((nodes at: 3) at: 2) to: result rightParenTokens.
	result addTokens: ((nodes at: 3) at: 3) to: result inoutTokens.
	result addTokens: ((nodes at: 3) at: 4) to: result letTokens.
	result addTokens: ((nodes at: 3) at: 5) to: result _Tokens.
	result addTokens: ((nodes at: 3) at: 6) to: result identifierTokens.
	result addTokens: ((nodes at: 3) at: 7) to: result colonTokens.
	result addTokens: ((nodes at: 3) at: 8) to: result leftBracketTokens.
	result addTokens: ((nodes at: 3) at: 9) to: result rightBracketTokens.
	result addTokens: ((nodes at: 3) at: 10) to: result leftBraceTokens.
	result addTokens: ((nodes at: 3) at: 11) to: result rightBraceTokens.
	result
		addTokens: ((nodes at: 3) at: 12)
		to: result integer_literalTokens.
	result
		addTokens: ((nodes at: 3) at: 13)
		to: result floating_point_literalTokens.
	result addTokens: ((nodes at: 3) at: 14) to: result operatorTokens.
	result
		addTokens: ((nodes at: 3) at: 15)
		to: result full_string_literalTokens.
	result addTokens: ((nodes at: 3) at: 16) to: result periodTokens.
	result addTokens: ((nodes at: 3) at: 17) to: result protocolTokens.
	result addTokens: ((nodes at: 3) at: 18) to: result lessThanTokens.
	result addTokens: ((nodes at: 3) at: 19) to: result greaterThanTokens.
	result
		addTokens: ((nodes at: 3) at: 20)
		to: result minusGreaterThanTokens.
	result addTokens: ((nodes at: 3) at: 21) to: result commaTokens.
	result
		addTokens: ((nodes at: 3) at: 22)
		to: result questionMarkTokens.
	result addTokens: ((nodes at: 3) at: 23) to: result bangTokens.
	result addTokens: ((nodes at: 3) at: 24) to: result typeTokens.
	result
		addTokens: ((nodes at: 3) at: 25)
		to: result periodPeriodPeriodTokens.
	result addTokens: ((nodes at: 3) at: 26) to: result equalTokens.
	result addObjects: ((nodes at: 3) at: 27) to: result expressions.
	result addTokens: ((nodes at: 3) at: 28) to: result varTokens.
	result block: (nodes at: 4).
	^ result