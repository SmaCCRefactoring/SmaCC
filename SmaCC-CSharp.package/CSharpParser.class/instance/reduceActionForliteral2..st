generated-reduction actions
reduceActionForliteral2: nodes
	| result |
	result := CSLiteralExpressionNode new.
	result token: (nodes at: 1).
	^ result