generated-reduction actions
reduceActionForself_expression1: nodes
	| result |
	result := SwiftSelfExpressionNode new.
	result selfToken: (nodes at: 1).
	^ result