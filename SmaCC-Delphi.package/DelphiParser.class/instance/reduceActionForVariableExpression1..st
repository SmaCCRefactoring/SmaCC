generated-reduction actions
reduceActionForVariableExpression1: nodes
	| result |
	result := DelphiVariableExpressionNode new.
	result name: (nodes at: 1).
	^ result