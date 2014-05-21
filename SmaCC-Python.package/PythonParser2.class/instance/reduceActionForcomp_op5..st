generated-reduction actions
reduceActionForcomp_op5: nodes
	| result |
	result := Array new: 10.
	result at: 5 put: (nodes at: 1).
	^ result