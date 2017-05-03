generated-reduction actions
reduceActionForPropertyReader1: nodes
	| result |
	result := DelphiPropertyReaderNode new.
	result readToken: (nodes at: 1).
	result expression: (nodes at: 2).
	^ result