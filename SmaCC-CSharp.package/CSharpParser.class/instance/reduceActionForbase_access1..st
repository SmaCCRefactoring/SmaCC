generated
reduceActionForbase_access1: nodes
	| result |
	result := CSBaseAccessNode new.
	result baseToken: (nodes at: 1).
	result periodToken: (nodes at: 2).
	result identifier: (nodes at: 3).
	^result