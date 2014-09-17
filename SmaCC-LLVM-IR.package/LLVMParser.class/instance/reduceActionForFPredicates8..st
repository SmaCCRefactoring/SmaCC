generated-reduction actions
reduceActionForFPredicates8: nodes
	| result |
	result := Array new: 16.
	result at: 8 put: (nodes at: 1).
	^ result