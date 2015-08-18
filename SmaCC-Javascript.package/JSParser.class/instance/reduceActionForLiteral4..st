generated-reduction actions
reduceActionForLiteral4: nodes
	| result |
	result := JSStringLiteralNode new.
	result _value: (nodes at: 1).
	^ result