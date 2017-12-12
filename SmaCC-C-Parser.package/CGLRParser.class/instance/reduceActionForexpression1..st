generated-reduction actions
reduceActionForexpression1: nodes
	| result |
	result := CGLRExpressionNode new.
	result addNode: (nodes at: 1) to: result expressions.
	^ result