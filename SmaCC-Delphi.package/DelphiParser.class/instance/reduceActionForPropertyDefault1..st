generated-reduction actions
reduceActionForPropertyDefault1: nodes
	| result |
	result := DelphiPropertyDefaultNode new.
	result defaultToken: (nodes at: 1).
	result expression: (nodes at: 2).
	^ result