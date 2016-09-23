generated-reduction actions
reduceActionForstruct_declaration1: nodes
	| result |
	result := SwiftStructDeclarationNode new.
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
	result structToken: (nodes at: 2).
	result addToken: (nodes at: 3) to: result identifierTokens.
	result addTokens: ((nodes at: 4) at: 1) to: result lessThanTokens.
	result addTokens: ((nodes at: 4) at: 2) to: result identifierTokens.
	result addTokens: ((nodes at: 4) at: 3) to: result colonTokens.
	result addTokens: ((nodes at: 4) at: 4) to: result commaTokens.
	result addTokens: ((nodes at: 4) at: 5) to: result greaterThanTokens.
	result addTokens: ((nodes at: 4) at: 6) to: result periodTokens.
	result addTokens: ((nodes at: 4) at: 7) to: result protocolTokens.
	result whereToken: ((nodes at: 4) at: 8).
	result addTokens: ((nodes at: 4) at: 9) to: result equalEqualTokens.
	result addToken: ((nodes at: 5) at: 1) to: result colonTokens.
	result addTokens: ((nodes at: 5) at: 2) to: result identifierTokens.
	result addTokens: ((nodes at: 5) at: 3) to: result lessThanTokens.
	result addTokens: ((nodes at: 5) at: 4) to: result commaTokens.
	result addTokens: ((nodes at: 5) at: 5) to: result greaterThanTokens.
	result addTokens: ((nodes at: 5) at: 6) to: result periodTokens.
	result addToken: ((nodes at: 6) at: 1) to: result leftBraceTokens.
	result addNodes: ((nodes at: 6) at: 2) to: result declarations.
	result addToken: ((nodes at: 6) at: 3) to: result rightBraceTokens.
	^ result