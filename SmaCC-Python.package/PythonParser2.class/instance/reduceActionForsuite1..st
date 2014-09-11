generated-reduction actions
reduceActionForsuite1: nodes
	| result |
	result := Array new: 4.
	result at: 1 put: (nodes at: 1).
	^ result