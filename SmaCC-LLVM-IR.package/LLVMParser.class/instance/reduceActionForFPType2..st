generated-reduction actions
reduceActionForFPType2: nodes
	| result |
	result := Array new: 5.
	result at: 2 put: (nodes at: 1).
	^ result