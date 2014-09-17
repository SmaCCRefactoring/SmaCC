generated-reduction actions
reduceActionForCastOps5: nodes
	| result |
	result := Array new: 12.
	result at: 5 put: (nodes at: 1).
	^ result