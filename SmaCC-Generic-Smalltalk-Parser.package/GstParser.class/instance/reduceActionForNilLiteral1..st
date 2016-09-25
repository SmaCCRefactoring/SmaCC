generated-reduction actions
reduceActionForNilLiteral1: nodes
	| result |
	result := GstNilLiteralNode new.
	result value: (nodes at: 1).
	^ result