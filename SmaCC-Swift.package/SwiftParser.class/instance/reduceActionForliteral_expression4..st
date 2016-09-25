generated-reduction actions
reduceActionForliteral_expression4: nodes
	| result |
	result := SwiftLiteralExpressionNode new.
	result __FILE__Token: (nodes at: 1).
	^ result