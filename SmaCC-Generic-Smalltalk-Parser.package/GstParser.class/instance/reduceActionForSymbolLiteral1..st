generated-reduction actions
reduceActionForSymbolLiteral1: nodes
	| result |
	result := GstSymbolLiteralNode new.
	result value: (nodes at: 1).
	^ result