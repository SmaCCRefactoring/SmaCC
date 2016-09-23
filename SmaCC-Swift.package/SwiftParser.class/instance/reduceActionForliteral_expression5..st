generated-reduction actions
reduceActionForliteral_expression5: nodes
	| result |
	result := SwiftLiteralExpressionNode new.
	result __LINE__Token: (nodes at: 1).
	^ result