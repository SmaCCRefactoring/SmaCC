generated-reduction actions
reduceActionForArithmeticOps6: nodes
	| result |
	result := Array new: 9.
	result at: 6 put: (nodes at: 1).
	^ result