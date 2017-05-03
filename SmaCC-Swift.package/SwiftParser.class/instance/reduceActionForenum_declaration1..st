generated-reduction actions
reduceActionForenum_declaration1: nodes
	| result |
	result := SwiftEnumDeclarationNode new.
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
	result addTokens: ((nodes at: 2) at: 1) to: result identifierTokens.
	result addTokens: ((nodes at: 2) at: 2) to: result lessThanTokens.
	result addTokens: ((nodes at: 2) at: 3) to: result colonTokens.
	result addTokens: ((nodes at: 2) at: 4) to: result commaTokens.
	result addTokens: ((nodes at: 2) at: 5) to: result greaterThanTokens.
	result addTokens: ((nodes at: 2) at: 6) to: result periodTokens.
	result addTokens: ((nodes at: 2) at: 7) to: result protocolTokens.
	result addTokens: ((nodes at: 2) at: 8) to: result whereTokens.
	result addTokens: ((nodes at: 2) at: 9) to: result equalEqualTokens.
	result addTokens: ((nodes at: 2) at: 10) to: result leftBraceTokens.
	result addTokens: ((nodes at: 2) at: 11) to: result _Tokens.
	result addTokens: ((nodes at: 2) at: 12) to: result leftParenTokens.
	result addTokens: ((nodes at: 2) at: 13) to: result rightParenTokens.
	result addTokens: ((nodes at: 2) at: 14) to: result leftBracketTokens.
	result
		addTokens: ((nodes at: 2) at: 15)
		to: result rightBracketTokens.
	result addTokens: ((nodes at: 2) at: 16) to: result rightBraceTokens.
	result
		addTokens: ((nodes at: 2) at: 17)
		to: result integer_literalTokens.
	result
		addTokens: ((nodes at: 2) at: 18)
		to: result floating_point_literalTokens.
	result addTokens: ((nodes at: 2) at: 19) to: result operatorTokens.
	result addTokens: ((nodes at: 2) at: 20) to: result importTokens.
	result addTokens: ((nodes at: 2) at: 21) to: result typealiasTokens.
	result addTokens: ((nodes at: 2) at: 22) to: result structTokens.
	result addTokens: ((nodes at: 2) at: 23) to: result classTokens.
	result addTokens: ((nodes at: 2) at: 24) to: result enumTokens.
	result addTokens: ((nodes at: 2) at: 25) to: result varTokens.
	result addTokens: ((nodes at: 2) at: 26) to: result funcTokens.
	result addTokens: ((nodes at: 2) at: 27) to: result mutatingTokens.
	result addTokens: ((nodes at: 2) at: 28) to: result nonmutatingTokens.
	result addTokens: ((nodes at: 2) at: 29) to: result overrideTokens.
	result addTokens: ((nodes at: 2) at: 30) to: result staticTokens.
	result addTokens: ((nodes at: 2) at: 31) to: result unownedTokens.
	result
		addTokens: ((nodes at: 2) at: 32)
		to: result unownedLeftParensafeRightParenTokens.
	result
		addTokens: ((nodes at: 2) at: 33)
		to: result unownedLeftParenunsafeRightParenTokens.
	result addTokens: ((nodes at: 2) at: 34) to: result weakTokens.
	result addTokens: ((nodes at: 2) at: 35) to: result letTokens.
	result addNodes: ((nodes at: 2) at: 36) to: result inializers.
	result
		addTokens: ((nodes at: 2) at: 37)
		to: result minusGreaterThanTokens.
	result
		addTokens: ((nodes at: 2) at: 38)
		to: result questionMarkTokens.
	result addTokens: ((nodes at: 2) at: 39) to: result bangTokens.
	result addTokens: ((nodes at: 2) at: 40) to: result typeTokens.
	result
		addTokens: ((nodes at: 2) at: 41)
		to: result periodPeriodPeriodTokens.
	result addTokens: ((nodes at: 2) at: 42) to: result inoutTokens.
	result addNodes: ((nodes at: 2) at: 43) to: result blocks.
	result addTokens: ((nodes at: 2) at: 44) to: result getTokens.
	result addTokens: ((nodes at: 2) at: 45) to: result setTokens.
	result addTokens: ((nodes at: 2) at: 46) to: result equalTokens.
	result addObjects: ((nodes at: 2) at: 47) to: result expressions.
	result addTokens: ((nodes at: 2) at: 48) to: result willSetTokens.
	result addTokens: ((nodes at: 2) at: 49) to: result didSetTokens.
	result addNodes: ((nodes at: 2) at: 50) to: result declarations.
	result addTokens: ((nodes at: 2) at: 51) to: result convenienceTokens.
	result addTokens: ((nodes at: 2) at: 52) to: result initTokens.
	result addTokens: ((nodes at: 2) at: 53) to: result deinitTokens.
	result addTokens: ((nodes at: 2) at: 54) to: result extensionTokens.
	result addTokens: ((nodes at: 2) at: 55) to: result subscriptTokens.
	result addTokens: ((nodes at: 2) at: 56) to: result caseTokens.
	result
		addTokens: ((nodes at: 2) at: 57)
		to: result full_string_literalTokens.
	^ result