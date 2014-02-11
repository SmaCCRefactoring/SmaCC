generated-reduction actions
reduceActionForcast_expression1: nodes
	| result |
	result := JavaCastExpressionNode new.
	result addToken: (nodes at: 1) to: result lefts.
	result type: (nodes at: 2).
	result addNodes: ((nodes at: 3) at: 1) to: result emptyDims.
	result addToken: (nodes at: 4) to: result rights.
	result expression: (nodes at: 5).
	^ result