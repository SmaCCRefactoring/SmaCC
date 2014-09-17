generated-reduction actions
reduceActionForCastOps8: nodes
	| result |
	result := Array new: 12.
	result at: 8 put: (nodes at: 1).
	^ result