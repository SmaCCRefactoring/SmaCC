generated-reduction actions
reduceActionForMemberExpression3: nodes
	| result |
	result := JSIndexedPropertyExpressionNode new.
	result expression: (nodes at: 1).
	result leftBracket: (nodes at: 2).
	result fieldExpression: (nodes at: 3).
	result rightBracket: (nodes at: 4).
	^ result