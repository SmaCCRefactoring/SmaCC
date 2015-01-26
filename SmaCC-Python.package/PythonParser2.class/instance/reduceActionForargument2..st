generated-reduction actions
reduceActionForargument2: nodes
	| result |
	result := PyArgumentNode new.
	result test: (nodes at: 1).
	result comp: (nodes at: 2).
	^ result