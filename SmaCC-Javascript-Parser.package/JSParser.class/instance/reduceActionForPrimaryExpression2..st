generated-reduction actions
reduceActionForPrimaryExpression2: nodes
	| result |
	result := JSNameExpressionNode new.
	result name: (nodes at: 1).
	^ result