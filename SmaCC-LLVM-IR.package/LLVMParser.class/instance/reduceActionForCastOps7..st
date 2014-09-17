generated-reduction actions
reduceActionForCastOps7: nodes
	| result |
	result := Array new: 12.
	result at: 7 put: (nodes at: 1).
	^ result