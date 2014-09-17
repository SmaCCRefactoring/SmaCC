generated-reduction actions
reduceActionForCastOps4: nodes
	| result |
	result := Array new: 12.
	result at: 4 put: (nodes at: 1).
	^ result