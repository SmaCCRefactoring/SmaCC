generated-reduction actions
reduceActionForCastOps6: nodes
	| result |
	result := Array new: 12.
	result at: 6 put: (nodes at: 1).
	^ result