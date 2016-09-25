generated-reduction actions
reduceActionForVariable1: nodes
	| result |
	result := GstVariableNode new.
	result name: (nodes at: 1).
	^ result