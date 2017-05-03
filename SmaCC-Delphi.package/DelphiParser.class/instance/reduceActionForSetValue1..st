generated-reduction actions
reduceActionForSetValue1: nodes
	| result |
	result := DelphiSingleSetValueNode new.
	result value: (nodes at: 1).
	^ result