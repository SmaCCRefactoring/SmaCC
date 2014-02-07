generated
reduceActionForarray_initializer3: nodes
	| result |
	result := JavaArrayInitializerNode new.
	result left: (nodes at: 1).
	result addToken: (nodes at: 2) to: result commas.
	result right: (nodes at: 3).
	^result