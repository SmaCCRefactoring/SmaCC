generated-reduction actions
reduceActionForprotocol_association_type_declaration1: nodes
	| result |
	result := SwiftProtocolAssociationTypeDeclarationNode new.
	result typealiasToken: ((nodes at: 1) at: 1).
	result addToken: ((nodes at: 1) at: 2) to: result identifierTokens.
	result addToken: ((nodes at: 2) at: 1) to: result colonTokens.
	result addTokens: ((nodes at: 2) at: 2) to: result identifierTokens.
	result addTokens: ((nodes at: 2) at: 3) to: result lessThanTokens.
	result addTokens: ((nodes at: 2) at: 4) to: result commaTokens.
	result addTokens: ((nodes at: 2) at: 5) to: result greaterThanTokens.
	result addTokens: ((nodes at: 2) at: 6) to: result periodTokens.
	result equalToken: ((nodes at: 3) at: 1).
	result addTokens: ((nodes at: 3) at: 2) to: result leftBracketTokens.
	result addTokens: ((nodes at: 3) at: 3) to: result identifierTokens.
	result addTokens: ((nodes at: 3) at: 4) to: result periodTokens.
	result addTokens: ((nodes at: 3) at: 5) to: result protocolTokens.
	result addTokens: ((nodes at: 3) at: 6) to: result lessThanTokens.
	result addTokens: ((nodes at: 3) at: 7) to: result greaterThanTokens.
	result addTokens: ((nodes at: 3) at: 8) to: result rightBracketTokens.
	result addTokens: ((nodes at: 3) at: 9) to: result colonTokens.
	result
		addTokens: ((nodes at: 3) at: 10)
		to: result minusGreaterThanTokens.
	result addTokens: ((nodes at: 3) at: 11) to: result commaTokens.
	result addTokens: ((nodes at: 3) at: 12) to: result leftParenTokens.
	result addTokens: ((nodes at: 3) at: 13) to: result rightParenTokens.
	result
		addTokens: ((nodes at: 3) at: 14)
		to: result questionMarkTokens.
	result addTokens: ((nodes at: 3) at: 15) to: result bangTokens.
	result addTokens: ((nodes at: 3) at: 16) to: result typeTokens.
	result
		addTokens: ((nodes at: 3) at: 17)
		to: result periodPeriodPeriodTokens.
	result addTokens: ((nodes at: 3) at: 18) to: result inoutTokens.
	result addTokens: ((nodes at: 3) at: 19) to: result _Tokens.
	result addTokens: ((nodes at: 3) at: 20) to: result leftBraceTokens.
	result addTokens: ((nodes at: 3) at: 21) to: result rightBraceTokens.
	result
		addTokens: ((nodes at: 3) at: 22)
		to: result integer_literalTokens.
	result
		addTokens: ((nodes at: 3) at: 23)
		to: result floating_point_literalTokens.
	result addTokens: ((nodes at: 3) at: 24) to: result operatorTokens.
	result
		addTokens: ((nodes at: 3) at: 25)
		to: result full_string_literalTokens.
	^ result