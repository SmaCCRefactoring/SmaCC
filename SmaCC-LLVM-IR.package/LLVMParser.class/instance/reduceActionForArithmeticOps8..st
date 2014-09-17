generated-reduction actions
reduceActionForArithmeticOps8: nodes
	| result |
	result := Array new: 9.
	result at: 8 put: (nodes at: 1).
	^ result