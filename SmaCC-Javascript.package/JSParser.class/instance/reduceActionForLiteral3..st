generated-reduction actions
reduceActionForLiteral3: nodes
	| result |
	result := JSNumericLiteralNode new.
	result _value: (nodes at: 1).
	^ result