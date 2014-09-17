generated-reduction actions
reduceActionForLogicalOps6: nodes
	| result |
	result := Array new: 6.
	result at: 6 put: (nodes at: 1).
	^ result