generated-reduction actions
reduceActionForArithmeticOps7: nodes
	| result |
	result := Array new: 9.
	result at: 7 put: (nodes at: 1).
	^ result