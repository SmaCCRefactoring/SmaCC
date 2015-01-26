generated-reduction actions
reduceActionForargument1: nodes
	| result |
	result := PyArgumentNode new.
	result test: (nodes at: 1).
	^ result