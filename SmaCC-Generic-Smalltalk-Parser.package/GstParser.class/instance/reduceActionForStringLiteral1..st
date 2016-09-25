generated-reduction actions
reduceActionForStringLiteral1: nodes
	| result |
	result := GstStringLiteralNode new.
	result value: (nodes at: 1).
	^ result