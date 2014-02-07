generated
reduceActionForliteral5: nodes
	| result |
	result := JavaStringLiteralNode new.
	result token: (nodes at: 1).
	^result