generated-reduction actions
reduceActionForArrayLiteral1: nodes
	| result |
	result := GstArrayLiteralNode new.
	result arrayStart: (nodes at: 1).
	result addNodes: (nodes at: 2) to: result values.
	result arrayStop: (nodes at: 3).
	^ result