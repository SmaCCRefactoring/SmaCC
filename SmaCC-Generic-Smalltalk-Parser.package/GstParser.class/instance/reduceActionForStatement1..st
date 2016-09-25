generated-reduction actions
reduceActionForStatement1: nodes
	| result |
	result := GstReturnNode new.
	result upArrow: (nodes at: 1).
	result value: (nodes at: 2).
	^ result