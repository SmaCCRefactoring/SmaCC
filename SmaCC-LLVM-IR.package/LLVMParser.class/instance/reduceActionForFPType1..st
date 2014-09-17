generated-reduction actions
reduceActionForFPType1: nodes
	| result |
	result := Array new: 5.
	result at: 1 put: (nodes at: 1).
	^ result