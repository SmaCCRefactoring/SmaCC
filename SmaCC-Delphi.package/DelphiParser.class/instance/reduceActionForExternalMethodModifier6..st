generated-reduction actions
reduceActionForExternalMethodModifier6: nodes
	| result |
	result := DelphiMethodModifierNode new.
	result modifier: (nodes at: 1).
	result semicolon: (nodes at: 2).
	^ result