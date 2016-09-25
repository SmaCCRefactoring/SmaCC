generated-reduction actions
reduceActionForimport_declaration1: nodes
	| result |
	result := SwiftImportDeclarationNode new.
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
	result importToken: (nodes at: 2).
	result typealiasToken: ((nodes at: 3) at: 1).
	result structToken: ((nodes at: 3) at: 2).
	result classToken: ((nodes at: 3) at: 3).
	result enumToken: ((nodes at: 3) at: 4).
	result protocolToken: ((nodes at: 3) at: 5).
	result varToken: ((nodes at: 3) at: 6).
	result funcToken: ((nodes at: 3) at: 7).
	result addTokens: ((nodes at: 4) at: 1) to: result identifierTokens.
	result addTokens: ((nodes at: 4) at: 2) to: result operatorTokens.
	result addTokens: ((nodes at: 4) at: 3) to: result periodTokens.
	^ result