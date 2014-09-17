generated-reduction actions
reduceActionForLogicalOps4: nodes
	| result |
	result := Array new: 6.
	result at: 4 put: (nodes at: 1).
	^ result