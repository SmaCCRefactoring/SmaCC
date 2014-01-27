generated
reduceActionForstackalloc_initializer1: nodes
	| result |
	result := CSStackallocInitializerNode new.
	result stackallocToken: (nodes at: 1).
	result type: (nodes at: 2).
	result leftBracketToken: (nodes at: 3).
	result expression: (nodes at: 4).
	result rightBracketToken: (nodes at: 5).
	^result