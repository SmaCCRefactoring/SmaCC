generated-reduction actions
reduceActionForCharacterLiteral1: nodes
	| result |
	result := GstCharacterLiteralNode new.
	result value: (nodes at: 1).
	^ result