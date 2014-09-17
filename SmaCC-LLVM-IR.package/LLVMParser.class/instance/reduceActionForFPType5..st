generated-reduction actions
reduceActionForFPType5: nodes
	| result |
	result := Array new: 5.
	result at: 5 put: (nodes at: 1).
	^ result