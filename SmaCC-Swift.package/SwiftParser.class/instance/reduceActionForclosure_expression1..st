generated-reduction actions
reduceActionForclosure_expression1: nodes
	| result |
	result := SwiftClosureExpressionNode new.
	result addToken: (nodes at: 1) to: result leftBraceTokens.
	result addTokens: ((nodes at: 2) at: 1) to: result leftParenTokens.
	result addTokens: ((nodes at: 2) at: 2) to: result rightParenTokens.
	result addTokens: ((nodes at: 2) at: 3) to: result inoutTokens.
	result addTokens: ((nodes at: 2) at: 4) to: result letTokens.
	result addTokens: ((nodes at: 2) at: 5) to: result _Tokens.
	result addTokens: ((nodes at: 2) at: 6) to: result identifierTokens.
	result addTokens: ((nodes at: 2) at: 7) to: result colonTokens.
	result addTokens: ((nodes at: 2) at: 8) to: result leftBracketTokens.
	result addTokens: ((nodes at: 2) at: 9) to: result periodTokens.
	result addTokens: ((nodes at: 2) at: 10) to: result protocolTokens.
	result addTokens: ((nodes at: 2) at: 11) to: result lessThanTokens.
	result addTokens: ((nodes at: 2) at: 12) to: result greaterThanTokens.
	result
		addTokens: ((nodes at: 2) at: 13)
		to: result rightBracketTokens.
	result
		addTokens: ((nodes at: 2) at: 14)
		to: result minusGreaterThanTokens.
	result addTokens: ((nodes at: 2) at: 15) to: result commaTokens.
	result
		addTokens: ((nodes at: 2) at: 16)
		to: result questionMarkTokens.
	result addTokens: ((nodes at: 2) at: 17) to: result bangTokens.
	result addTokens: ((nodes at: 2) at: 18) to: result typeTokens.
	result
		addTokens: ((nodes at: 2) at: 19)
		to: result periodPeriodPeriodTokens.
	result addTokens: ((nodes at: 2) at: 20) to: result equalTokens.
	result addObjects: ((nodes at: 2) at: 21) to: result expressions.
	result addTokens: ((nodes at: 2) at: 22) to: result varTokens.
	result addTokens: ((nodes at: 2) at: 23) to: result leftBraceTokens.
	result addTokens: ((nodes at: 2) at: 24) to: result rightBraceTokens.
	result
		addTokens: ((nodes at: 2) at: 25)
		to: result integer_literalTokens.
	result
		addTokens: ((nodes at: 2) at: 26)
		to: result floating_point_literalTokens.
	result addTokens: ((nodes at: 2) at: 27) to: result operatorTokens.
	result
		addTokens: ((nodes at: 2) at: 28)
		to: result full_string_literalTokens.
	result inToken: ((nodes at: 2) at: 29).
	result weakToken: ((nodes at: 2) at: 30).
	result unownedToken: ((nodes at: 2) at: 31).
	result unownedLeftParensafeRightParenToken: ((nodes at: 2) at: 32).
	result unownedLeftParenunsafeRightParenToken: ((nodes at: 2) at: 33).
	result addNodes: (nodes at: 3) to: result statements.
	result addToken: (nodes at: 4) to: result rightBraceTokens.
	^ result