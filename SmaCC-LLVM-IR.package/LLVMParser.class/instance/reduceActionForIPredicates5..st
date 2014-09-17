generated-reduction actions
reduceActionForIPredicates5: nodes
	| result |
	result := Array new: 10.
	result at: 5 put: (nodes at: 1).
	^ result