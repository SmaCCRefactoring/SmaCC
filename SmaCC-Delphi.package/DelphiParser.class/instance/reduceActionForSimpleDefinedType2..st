generated-reduction actions
reduceActionForSimpleDefinedType2: nodes
	| result |
	result := DelphiPointerTypeNode new.
	result upArrowToken: (nodes at: 1).
	result type: (nodes at: 2).
	^ result