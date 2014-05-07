generated-reduction actions
reduceActionForcomp_op11: nodes
	| result |
	result := Array new: 10.
	result at: 10 put: (nodes at: 1).
	result at: 9 put: (nodes at: 2).
	^ result