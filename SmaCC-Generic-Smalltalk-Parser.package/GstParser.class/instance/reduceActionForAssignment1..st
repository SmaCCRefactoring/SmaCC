generated-reduction actions
reduceActionForAssignment1: nodes
	| result |
	result := GstAssignmentNode new.
	result variable: (nodes at: 1).
	result assignmentToken: (nodes at: 2).
	result value: (nodes at: 3).
	^ result