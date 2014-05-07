generated-reduction actions
reduceActionForaugassign10: nodes
	| result |
	result := Array new: 12.
	result at: 10 put: (nodes at: 1).
	^ result