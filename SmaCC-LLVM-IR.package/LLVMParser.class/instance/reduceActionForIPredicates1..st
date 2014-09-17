generated-reduction actions
reduceActionForIPredicates1: nodes
	| result |
	result := Array new: 10.
	result at: 1 put: (nodes at: 1).
	^ result