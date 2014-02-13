generated-reduction actions
reduceActionForpointer_type2: nodes
	| result |
	result := CSPointerTypeNode new.
	result type: (nodes at: 1).
	result timesToken: (nodes at: 2).
	^ result