generated-reduction actions
reduceActionForaugassign2: nodes
	| result |
	result := Array new: 12.
	result at: 2 put: (nodes at: 1).
	^ result