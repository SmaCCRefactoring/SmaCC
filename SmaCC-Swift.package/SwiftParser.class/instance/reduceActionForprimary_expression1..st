generated-reduction actions
reduceActionForprimary_expression1: nodes
	| result |
	result := SwiftPrimaryExpressionNode new.
	result identifierToken: (nodes at: 1).
	result lessThanToken: ((nodes at: 2) at: 1).
	result addTokens: ((nodes at: 2) at: 2) to: result commaTokens.
	result greaterThanToken: ((nodes at: 2) at: 3).
	^ result