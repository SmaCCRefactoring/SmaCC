generated
reduceActionForliteral2: nodes
	| result |
	result := JavaFloatLiteralNode new.
	result token: (nodes at: 1).
	^result