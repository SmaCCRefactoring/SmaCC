generated-reduction actions
reduceActionForexpression2: nodes
	| result |
	result := SwiftBinaryExpressionNode new.
	result addNodes: (nodes at: 2) to: result operators.
	^ result