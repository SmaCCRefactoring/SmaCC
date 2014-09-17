generated-reduction actions
reduceActionForFPType4: nodes
	| result |
	result := Array new: 5.
	result at: 4 put: (nodes at: 1).
	^ result