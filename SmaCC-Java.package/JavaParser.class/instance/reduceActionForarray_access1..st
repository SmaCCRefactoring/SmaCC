generated
reduceActionForarray_access1: nodes
	| result |
	result := JavaArrayAccessNode new.
	result array: (nodes at: 1).
	result addToken: (nodes at: 2) to: result lefts.
	result expression: (nodes at: 3).
	result addToken: (nodes at: 4) to: result rights.
	^result