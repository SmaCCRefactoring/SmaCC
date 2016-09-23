generated-reduction actions
reduceActionForliteral_expression2: nodes
	| result |
	result := SwiftLiteralExpressionNode new.
	result leftBracketToken: ((nodes at: 1) at: 1).
	result addObjects: ((nodes at: 1) at: 2) to: result expressions.
	result addTokens: ((nodes at: 1) at: 3) to: result commaTokens.
	result rightBracketToken: ((nodes at: 1) at: 4).
	^ result