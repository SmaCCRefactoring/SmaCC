generated-reduction actions
reduceActionForatom9: nodes
	| result |
	result := PySymbolNode new.
	result nameToken: (nodes at: 1).
	^ result