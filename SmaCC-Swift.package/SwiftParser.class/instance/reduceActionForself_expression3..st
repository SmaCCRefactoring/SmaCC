generated-reduction actions
reduceActionForself_expression3: nodes
	| result |
	result := SwiftSelfExpressionNode new.
	result selfToken: (nodes at: 1).
	result leftBracketToken: (nodes at: 2).
	result expression: (nodes at: 3).
	result rightBracketToken: (nodes at: 4).
	^ result