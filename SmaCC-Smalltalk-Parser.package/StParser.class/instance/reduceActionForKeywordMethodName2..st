generated-reduction actions
reduceActionForKeywordMethodName2: nodes
	(nodes at: 1) first nextPutAll: (nodes at: 2) value.
	(nodes at: 1) last add: (nodes at: 3).
	^ nodes at: 1