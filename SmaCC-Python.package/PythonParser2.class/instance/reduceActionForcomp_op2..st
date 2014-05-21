generated-reduction actions
reduceActionForcomp_op2: nodes
	| result |
	result := Array new: 10.
	result at: 2 put: (nodes at: 1).
	^ result