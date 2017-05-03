generated-reduction actions
reduceActionForValue4: nodes
	| result |
	result := DelphiFormNamedValueNode new.
	result name: (nodes at: 1).
	^ result