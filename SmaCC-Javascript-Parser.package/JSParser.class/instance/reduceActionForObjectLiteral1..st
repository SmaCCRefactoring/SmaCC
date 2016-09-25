generated-reduction actions
reduceActionForObjectLiteral1: nodes
	| result |
	result := JSObjectLiteralNode new.
	result leftBrace: (nodes at: 1).
	result rightBrace: (nodes at: 2).
	^ result