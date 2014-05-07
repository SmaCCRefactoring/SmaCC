generated-reduction actions
reduceActionForcomp_op9: nodes
	| result |
	result := Array new: 10.
	result at: 9 put: (nodes at: 1).
	result at: 8 put: (nodes at: 2).
	^ result