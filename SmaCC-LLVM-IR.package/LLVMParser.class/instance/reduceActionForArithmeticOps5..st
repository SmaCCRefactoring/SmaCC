generated-reduction actions
reduceActionForArithmeticOps5: nodes
	| result |
	result := Array new: 9.
	result at: 5 put: (nodes at: 1).
	^ result