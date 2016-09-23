generated-reduction actions
reduceActionForliteral_expression6: nodes
	| result |
	result := SwiftLiteralExpressionNode new.
	result __COLUMN__Token: (nodes at: 1).
	^ result