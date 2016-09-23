generated-reduction actions
reduceActionForparenthesized_expression1: nodes
	| result |
	result := SwiftParenthesizedExpressionNode new.
	result leftParenToken: (nodes at: 1).
	result addObjects: ((nodes at: 2) at: 1) to: result expressions.
	result addTokens: ((nodes at: 2) at: 2) to: result identifierTokens.
	result addTokens: ((nodes at: 2) at: 3) to: result colonTokens.
	result addTokens: ((nodes at: 2) at: 4) to: result commaTokens.
	result rightParenToken: (nodes at: 3).
	^ result