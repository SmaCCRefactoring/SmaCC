generated-reduction actions
reduceActionForIPredicates10: nodes
	| result |
	result := Array new: 10.
	result at: 10 put: (nodes at: 1).
	^ result