generated-reduction actions
reduceActionForbinary_expression1: nodes
	| result |
	result := SwiftBinaryOperatorNode new.
	result addToken: (nodes at: 1) to: result operatorTokens.
	^ result