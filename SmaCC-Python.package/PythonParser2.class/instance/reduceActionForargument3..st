generated-reduction actions
reduceActionForargument3: nodes
	| result |
	result := PyArgumentNode new.
	result test: (nodes at: 1).
	result equalToken: (nodes at: 2).
	result test2: (nodes at: 3).
	^ result