generated-reduction actions
reduceActionForpostfix_self_expression1: nodes
	| result |
	result := SwiftPostfixSelfExpressionNode new.
	result addTokens: ((nodes at: 1) at: 1) to: result identifierTokens.
	result addTokens: ((nodes at: 1) at: 2) to: result lessThanTokens.
	result addTokens: ((nodes at: 1) at: 3) to: result commaTokens.
	result addTokens: ((nodes at: 1) at: 4) to: result greaterThanTokens.
	result
		addTokens: ((nodes at: 1) at: 5)
		to: result integer_literalTokens.
	result
		addTokens: ((nodes at: 1) at: 6)
		to: result floating_point_literalTokens.
	result
		addTokens: ((nodes at: 1) at: 7)
		to: result full_string_literalTokens.
	result addTokens: ((nodes at: 1) at: 8) to: result leftBracketTokens.
	result addObjects: ((nodes at: 1) at: 9) to: result expressions.
	result
		addTokens: ((nodes at: 1) at: 10)
		to: result rightBracketTokens.
	result addObjects: ((nodes at: 1) at: 11) to: result keyExpressions.
	result addTokens: ((nodes at: 1) at: 12) to: result colonTokens.
	result addObjects: ((nodes at: 1) at: 13) to: result valueExpressions.
	result __FILE__Token: ((nodes at: 1) at: 14).
	result __LINE__Token: ((nodes at: 1) at: 15).
	result __COLUMN__Token: ((nodes at: 1) at: 16).
	result __FUNCTION__Token: ((nodes at: 1) at: 17).
	result addTokens: ((nodes at: 1) at: 18) to: result selfTokens.
	result addTokens: ((nodes at: 1) at: 19) to: result periodTokens.
	result addTokens: ((nodes at: 1) at: 20) to: result initTokens.
	result addTokens: ((nodes at: 1) at: 21) to: result leftBraceTokens.
	result addTokens: ((nodes at: 1) at: 22) to: result leftParenTokens.
	result addTokens: ((nodes at: 1) at: 23) to: result rightParenTokens.
	result addTokens: ((nodes at: 1) at: 24) to: result inoutTokens.
	result addTokens: ((nodes at: 1) at: 25) to: result letTokens.
	result addTokens: ((nodes at: 1) at: 26) to: result _Tokens.
	result addTokens: ((nodes at: 1) at: 27) to: result rightBraceTokens.
	result addTokens: ((nodes at: 1) at: 28) to: result operatorTokens.
	result addTokens: ((nodes at: 1) at: 29) to: result protocolTokens.
	result
		addTokens: ((nodes at: 1) at: 30)
		to: result minusGreaterThanTokens.
	result
		addTokens: ((nodes at: 1) at: 31)
		to: result questionMarkTokens.
	result addTokens: ((nodes at: 1) at: 32) to: result bangTokens.
	result addTokens: ((nodes at: 1) at: 33) to: result typeTokens.
	result
		addTokens: ((nodes at: 1) at: 34)
		to: result periodPeriodPeriodTokens.
	result addTokens: ((nodes at: 1) at: 35) to: result equalTokens.
	result addTokens: ((nodes at: 1) at: 36) to: result varTokens.
	result inToken: ((nodes at: 1) at: 37).
	result weakToken: ((nodes at: 1) at: 38).
	result unownedToken: ((nodes at: 1) at: 39).
	result unownedLeftParensafeRightParenToken: ((nodes at: 1) at: 40).
	result unownedLeftParenunsafeRightParenToken: ((nodes at: 1) at: 41).
	result addNodes: ((nodes at: 1) at: 42) to: result statements.
	result addTokens: ((nodes at: 1) at: 43) to: result dynamicTypeTokens.
	result addToken: (nodes at: 2) to: result periodTokens.
	result addToken: (nodes at: 3) to: result selfTokens.
	^ result