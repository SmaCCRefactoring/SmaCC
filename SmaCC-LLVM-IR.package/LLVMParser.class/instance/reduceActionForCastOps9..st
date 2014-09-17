generated-reduction actions
reduceActionForCastOps9: nodes
	| result |
	result := Array new: 12.
	result at: 9 put: (nodes at: 1).
	^ result