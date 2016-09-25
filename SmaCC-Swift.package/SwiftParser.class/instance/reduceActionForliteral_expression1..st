generated-reduction actions
reduceActionForliteral_expression1: nodes
	| result |
	result := SwiftLiteralExpressionNode new.
	result integer_literalToken: ((nodes at: 1) at: 1).
	result floating_point_literalToken: ((nodes at: 1) at: 2).
	result full_string_literalToken: ((nodes at: 1) at: 3).
	^ result