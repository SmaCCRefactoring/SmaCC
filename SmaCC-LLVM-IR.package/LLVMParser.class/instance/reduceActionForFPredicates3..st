generated-reduction actions
reduceActionForFPredicates3: nodes
	| result |
	result := Array new: 16.
	result at: 3 put: (nodes at: 1).
	^ result