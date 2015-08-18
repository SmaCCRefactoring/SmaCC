generated-reduction actions
reduceActionForPropertyAssignment1: nodes
	| result |
	result := JSPropertyAssignmentNode new.
	result key: (nodes at: 1).
	result colonToken: (nodes at: 2).
	result _value: (nodes at: 3).
	^ result