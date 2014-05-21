generated-reduction actions
reduceActionForaugassign3: nodes
	| result |
	result := Array new: 12.
	result at: 3 put: (nodes at: 1).
	^ result