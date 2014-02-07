generated
reduceActionForarray_initializer2: nodes
	| result |
	result := JavaArrayInitializerNode new.
	result left: (nodes at: 1).
	result addNodes: ((nodes at: 2) at: 1) to: result initializers.
	result addTokens: ((nodes at: 2) at: 2) to: result commas.
	result right: (nodes at: 3).
	^result