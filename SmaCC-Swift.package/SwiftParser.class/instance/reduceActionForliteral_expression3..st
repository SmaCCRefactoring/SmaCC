generated-reduction actions
reduceActionForliteral_expression3: nodes
	| result |
	result := SwiftLiteralExpressionNode new.
	result leftBracketToken: ((nodes at: 1) at: 1).
	result addObjects: ((nodes at: 1) at: 2) to: result keyExpressions.
	result addTokens: ((nodes at: 1) at: 3) to: result colonTokens.
	result addObjects: ((nodes at: 1) at: 4) to: result valueExpressions.
	result addTokens: ((nodes at: 1) at: 5) to: result commaTokens.
	result rightBracketToken: ((nodes at: 1) at: 6).
	^ result