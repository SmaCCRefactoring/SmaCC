generated-reduction actions
reduceActionForIPredicates8: nodes
	| result |
	result := Array new: 10.
	result at: 8 put: (nodes at: 1).
	^ result