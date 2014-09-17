generated-reduction actions
reduceActionForIPredicates3: nodes
	| result |
	result := Array new: 10.
	result at: 3 put: (nodes at: 1).
	^ result