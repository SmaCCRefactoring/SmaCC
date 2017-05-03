generated-reduction actions
reduceActionForPropertyIndex1: nodes
	| result |
	result := DelphiPropertyIndexNode new.
	result indexToken: (nodes at: 1).
	result expression: (nodes at: 2).
	^ result