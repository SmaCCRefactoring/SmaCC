generated-reduction actions
reduceActionForCastOps12: nodes
	| result |
	result := Array new: 12.
	result at: 12 put: (nodes at: 1).
	^ result