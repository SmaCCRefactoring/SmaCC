generated-reduction actions
reduceActionForFPredicates1: nodes
	| result |
	result := Array new: 16.
	result at: 1 put: (nodes at: 1).
	^ result