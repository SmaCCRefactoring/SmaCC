generated-reduction actions
reduceActionForconstant_declaration1: nodes
	| result |
	result := SwiftConstantDeclarationNode new.
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
	result addTokens: ((nodes at: 2) at: 1) to: result classTokens.
	result addTokens: ((nodes at: 2) at: 2) to: result mutatingTokens.
	result addTokens: ((nodes at: 2) at: 3) to: result nonmutatingTokens.
	result addTokens: ((nodes at: 2) at: 4) to: result overrideTokens.
	result addTokens: ((nodes at: 2) at: 5) to: result staticTokens.
	result addTokens: ((nodes at: 2) at: 6) to: result unownedTokens.
	result
		addTokens: ((nodes at: 2) at: 7)
		to: result unownedLeftParensafeRightParenTokens.
	result
		addTokens: ((nodes at: 2) at: 8)
		to: result unownedLeftParenunsafeRightParenTokens.
	result addTokens: ((nodes at: 2) at: 9) to: result weakTokens.
	result letToken: (nodes at: 3).
	result addNodes: ((nodes at: 4) at: 1) to: result inializers.
	result addTokens: ((nodes at: 4) at: 2) to: result commaTokens.
	^ result