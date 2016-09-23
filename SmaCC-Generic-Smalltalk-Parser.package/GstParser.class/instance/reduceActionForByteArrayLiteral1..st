generated-reduction actions
reduceActionForByteArrayLiteral1: nodes
	| result |
	result := GstByteArrayLiteralNode new.
	result arrayStart: (nodes at: 1).
	result addNodes: (nodes at: 2) to: result values.
	result arrayStop: (nodes at: 3).
	^ result