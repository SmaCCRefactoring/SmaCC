generated-reduction actions
reduceActionForExpression10: nodes
	| result |
	result := DelphiLiteralExpressionNode new.
	result value: (nodes at: 1).
	^ result