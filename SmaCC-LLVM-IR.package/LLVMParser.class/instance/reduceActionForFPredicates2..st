generated-reduction actions
reduceActionForFPredicates2: nodes
	| result |
	result := Array new: 16.
	result at: 2 put: (nodes at: 1).
	^ result