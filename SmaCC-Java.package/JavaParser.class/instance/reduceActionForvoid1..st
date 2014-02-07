generated
reduceActionForvoid1: nodes
	| result |
	result := JavaVoidTypeNode new.
	result voidToken: (nodes at: 1).
	^result