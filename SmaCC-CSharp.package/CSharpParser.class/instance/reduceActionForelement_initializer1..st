generated
reduceActionForelement_initializer1: nodes
	| result |
	result := CSElementInitializerNode new.
	result addNode: (nodes at: 1) to: result expressions.
	^result