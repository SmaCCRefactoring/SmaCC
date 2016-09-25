generated-reduction actions
reduceActionForinfix_operator_declaration1: nodes
	| result |
	result := SwiftInfixOperatorDeclarationNode new.
	result addToken: (nodes at: 1) to: result operatorTokens.
	result infixToken: (nodes at: 2).
	result addToken: (nodes at: 3) to: result operatorTokens.
	result leftBraceToken: (nodes at: 4).
	result precedenceToken: ((nodes at: 5) at: 1).
	result integer_literalToken: ((nodes at: 5) at: 2).
	result associativityToken: ((nodes at: 5) at: 3).
	result leftToken: ((nodes at: 5) at: 4).
	result rightToken: ((nodes at: 5) at: 5).
	result noneToken: ((nodes at: 5) at: 6).
	result rightBraceToken: (nodes at: 6).
	^ result