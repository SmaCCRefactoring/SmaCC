generated-reduction actions
reduceActionForPropertyModifiers2: nodes
	| result |
	result := DelphiPropertyModifierNode new.
	result defaultToken: (nodes at: 1).
	result semicolon: (nodes at: 2).
	^ result