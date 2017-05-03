generated-reduction actions
reduceActionForPropertyDefault3: nodes
	| result |
	result := DelphiPropertyDefaultNode new.
	result nodefaultToken: (nodes at: 1).
	^ result