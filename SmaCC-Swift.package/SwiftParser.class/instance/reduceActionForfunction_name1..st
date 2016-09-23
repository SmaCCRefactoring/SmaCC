generated-reduction actions
reduceActionForfunction_name1: nodes
	| result |
	result := Array new: 2.
	result at: 1 put: (nodes at: 1).
	^ result