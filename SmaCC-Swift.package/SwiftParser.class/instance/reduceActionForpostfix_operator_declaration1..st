generated-reduction actions
reduceActionForpostfix_operator_declaration1: nodes
	| result |
	result := SwiftPostfixOperatorDeclarationNode new.
	result addToken: (nodes at: 1) to: result operatorTokens.
	result postfixToken: (nodes at: 2).
	result addToken: (nodes at: 3) to: result operatorTokens.
	result leftBraceToken: (nodes at: 4).
	result rightBraceToken: (nodes at: 5).
	^ result