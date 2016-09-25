generated-reduction actions
reduceActionForself_expression4: nodes
	| result |
	result := SwiftSelfExpressionNode new.
	result selfToken: (nodes at: 1).
	result periodToken: (nodes at: 2).
	result initToken: (nodes at: 3).
	^ result