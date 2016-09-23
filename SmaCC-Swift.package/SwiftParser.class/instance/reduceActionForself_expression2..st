generated-reduction actions
reduceActionForself_expression2: nodes
	| result |
	result := SwiftSelfExpressionNode new.
	result selfToken: (nodes at: 1).
	result periodToken: (nodes at: 2).
	result identifierToken: (nodes at: 3).
	^ result