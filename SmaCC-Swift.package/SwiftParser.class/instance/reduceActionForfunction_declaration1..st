generated-reduction actions
reduceActionForfunction_declaration1: nodes
	| result |
	result := SwiftFunctionDeclarationNode new.
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
	result addTokens: ((nodes at: 1) at: 13) to: result classTokens.
	result addTokens: ((nodes at: 1) at: 14) to: result mutatingTokens.
	result addTokens: ((nodes at: 1) at: 15) to: result nonmutatingTokens.
	result addTokens: ((nodes at: 1) at: 16) to: result overrideTokens.
	result addTokens: ((nodes at: 1) at: 17) to: result staticTokens.
	result addTokens: ((nodes at: 1) at: 18) to: result unownedTokens.
	result
		addTokens: ((nodes at: 1) at: 19)
		to: result unownedLeftParensafeRightParenTokens.
	result
		addTokens: ((nodes at: 1) at: 20)
		to: result unownedLeftParenunsafeRightParenTokens.
	result addTokens: ((nodes at: 1) at: 21) to: result weakTokens.
	result funcToken: ((nodes at: 1) at: 22).
	result addToken: ((nodes at: 2) at: 1) to: result identifierTokens.
	result addToken: ((nodes at: 2) at: 2) to: result operatorTokens.
	result addTokens: ((nodes at: 3) at: 1) to: result lessThanTokens.
	result addTokens: ((nodes at: 3) at: 2) to: result identifierTokens.
	result addTokens: ((nodes at: 3) at: 3) to: result colonTokens.
	result addTokens: ((nodes at: 3) at: 4) to: result commaTokens.
	result addTokens: ((nodes at: 3) at: 5) to: result greaterThanTokens.
	result addTokens: ((nodes at: 3) at: 6) to: result periodTokens.
	result addTokens: ((nodes at: 3) at: 7) to: result protocolTokens.
	result whereToken: ((nodes at: 3) at: 8).
	result addTokens: ((nodes at: 3) at: 9) to: result equalEqualTokens.
	result addTokens: ((nodes at: 4) at: 1) to: result leftParenTokens.
	result addTokens: ((nodes at: 4) at: 2) to: result rightParenTokens.
	result addTokens: ((nodes at: 4) at: 3) to: result commaTokens.
	result addTokens: ((nodes at: 4) at: 4) to: result colonTokens.
	result addTokens: ((nodes at: 4) at: 5) to: result identifierTokens.
	result addTokens: ((nodes at: 4) at: 6) to: result periodTokens.
	result addTokens: ((nodes at: 4) at: 7) to: result protocolTokens.
	result addTokens: ((nodes at: 4) at: 8) to: result lessThanTokens.
	result addTokens: ((nodes at: 4) at: 9) to: result greaterThanTokens.
	result addTokens: ((nodes at: 4) at: 10) to: result varTokens.
	result
		addTokens: ((nodes at: 4) at: 11)
		to: result periodPeriodPeriodTokens.
	result addTokens: ((nodes at: 4) at: 12) to: result inoutTokens.
	result addTokens: ((nodes at: 4) at: 13) to: result letTokens.
	result addTokens: ((nodes at: 4) at: 14) to: result _Tokens.
	result addTokens: ((nodes at: 4) at: 15) to: result equalTokens.
	result addObjects: ((nodes at: 4) at: 16) to: result expressions.
	result addTokens: ((nodes at: 4) at: 17) to: result leftBracketTokens.
	result
		addTokens: ((nodes at: 4) at: 18)
		to: result rightBracketTokens.
	result
		addTokens: ((nodes at: 4) at: 19)
		to: result minusGreaterThanTokens.
	result
		addTokens: ((nodes at: 4) at: 20)
		to: result questionMarkTokens.
	result addTokens: ((nodes at: 4) at: 21) to: result bangTokens.
	result addTokens: ((nodes at: 4) at: 22) to: result typeTokens.
	result addTokens: ((nodes at: 4) at: 23) to: result leftBraceTokens.
	result addTokens: ((nodes at: 4) at: 24) to: result rightBraceTokens.
	result
		addTokens: ((nodes at: 4) at: 25)
		to: result integer_literalTokens.
	result
		addTokens: ((nodes at: 4) at: 26)
		to: result floating_point_literalTokens.
	result addTokens: ((nodes at: 4) at: 27) to: result operatorTokens.
	result
		addTokens: ((nodes at: 4) at: 28)
		to: result full_string_literalTokens.
	result block: (nodes at: 5).
	^ result