generated-reduction actions
reduceActionForaugassign1: nodes
	| result |
	result := Array new: 12.
	result at: 1 put: (nodes at: 1).
	^ result