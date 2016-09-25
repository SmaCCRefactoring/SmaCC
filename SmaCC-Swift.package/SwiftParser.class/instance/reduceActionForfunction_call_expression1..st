generated-reduction actions
reduceActionForfunction_call_expression1: nodes
	| result |
	result := SwiftFunctionCallExpressionNode new.
	result addObject: (nodes at: 1) to: result expressions.
	^ result