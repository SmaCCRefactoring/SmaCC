generated-reduction actions
reduceActionForBooleanLiteral1: nodes
	| result |
	result := GstBooleanLiteralNode new.
	result value: (nodes at: 1).
	^ result