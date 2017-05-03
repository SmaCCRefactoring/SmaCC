generated-reduction actions
reduceActionForAssignment1: nodes
	| result |
	result := DelphiFormPropertyNode new.
	result name: (nodes at: 1).
	result equalsToken: (nodes at: 2).
	result value: (nodes at: 3).
	^ result