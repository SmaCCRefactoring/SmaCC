generated-reduction actions
reduceActionForLogicalOps5: nodes
	| result |
	result := Array new: 6.
	result at: 5 put: (nodes at: 1).
	^ result