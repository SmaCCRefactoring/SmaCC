generated-reduction actions
reduceActionForenumerator1: nodes
	| result |
	result := CGLREnumeratorNode new.
	result symbol: (nodes at: 1).
	^ result