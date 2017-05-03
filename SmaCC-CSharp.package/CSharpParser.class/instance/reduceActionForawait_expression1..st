generated-reduction actions
reduceActionForawait_expression1: nodes
	| result |
	result := CSAwaitExpressionNode new.
	result awaitToken: (nodes at: 1).
	result expression: (nodes at: 2).
	^ result