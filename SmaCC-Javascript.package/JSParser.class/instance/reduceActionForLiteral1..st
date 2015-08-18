generated-reduction actions
reduceActionForLiteral1: nodes
	| result |
	result := JSNullLiteralNode new.
	result _value: (nodes at: 1).
	^ result