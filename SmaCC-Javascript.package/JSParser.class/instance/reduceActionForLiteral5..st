generated-reduction actions
reduceActionForLiteral5: nodes
	| result |
	result := JSRegularExpressionLiteralNode new.
	result _value: (nodes at: 1).
	^ result