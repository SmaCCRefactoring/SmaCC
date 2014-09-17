generated-reduction actions
reduceActionForFPType3: nodes
	| result |
	result := Array new: 5.
	result at: 3 put: (nodes at: 1).
	^ result