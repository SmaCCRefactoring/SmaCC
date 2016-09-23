generated-reduction actions
reduceActionForNumberLiteral1: nodes
	| result |
	result := GstNumberLiteralNode new.
	result value: (nodes at: 1).
	^ result