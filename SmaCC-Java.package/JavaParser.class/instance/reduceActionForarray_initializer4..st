generated
reduceActionForarray_initializer4: nodes
	| result |
	result := JavaArrayInitializerNode new.
	result left: (nodes at: 1).
	result right: (nodes at: 2).
	^result