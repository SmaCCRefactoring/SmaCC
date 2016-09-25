generated-reduction actions
reduceActionForliteral_expression7: nodes
	| result |
	result := SwiftLiteralExpressionNode new.
	result __FUNCTION__Token: (nodes at: 1).
	^ result