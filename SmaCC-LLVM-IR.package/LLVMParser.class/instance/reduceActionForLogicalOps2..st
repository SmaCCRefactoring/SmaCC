generated-reduction actions
reduceActionForLogicalOps2: nodes
	| result |
	result := Array new: 6.
	result at: 2 put: (nodes at: 1).
	^ result