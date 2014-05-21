generated-reduction actions
reduceActionForcomp_op4: nodes
	| result |
	result := Array new: 10.
	result at: 4 put: (nodes at: 1).
	^ result