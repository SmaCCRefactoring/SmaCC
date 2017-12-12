generated-reduction actions
reduceActionForenumerator2: nodes
	| result |
	result := CGLREnumeratorNode new.
	result symbol: (nodes at: 1).
	result equalToken: (nodes at: 2).
	result expr: (nodes at: 3).
	^ result