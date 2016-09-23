generated-reduction actions
reduceActionForforced_value_expression1: nodes
	| result |
	result := SwiftForcedValueExpressionNode new.
	result expression: (nodes at: 1).
	result bangToken: (nodes at: 2).
	^ result