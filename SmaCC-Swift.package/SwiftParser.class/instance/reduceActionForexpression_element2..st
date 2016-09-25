generated-reduction actions
reduceActionForexpression_element2: nodes
	| result |
	result := SwiftNamedExpressionNode new.
	result identifierToken: (nodes at: 1).
	result colonToken: (nodes at: 2).
	result expression: (nodes at: 3).
	^ result