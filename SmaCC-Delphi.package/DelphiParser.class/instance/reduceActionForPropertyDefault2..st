generated-reduction actions
reduceActionForPropertyDefault2: nodes
	| result |
	result := DelphiPropertyDefaultNode new.
	result defaultToken: (nodes at: 1).
	^ result