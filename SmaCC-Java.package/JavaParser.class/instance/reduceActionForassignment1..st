generated-reduction actions
reduceActionForassignment1: nodes
	| result |
	result := JavaAssignmentNode new.
	result variable: (nodes at: 1).
	result op: (nodes at: 2).
	result _value: (nodes at: 3).
	^ result