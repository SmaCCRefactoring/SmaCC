generated
reduceActionForliteral4: nodes
	| result |
	result := JavaCharacterLiteralNode new.
	result token: (nodes at: 1).
	^result