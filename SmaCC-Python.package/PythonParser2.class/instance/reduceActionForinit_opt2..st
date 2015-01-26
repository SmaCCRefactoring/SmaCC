generated-reduction actions
reduceActionForinit_opt2: nodes
	| result |
	result := PyInitOptNode new.
	result equalToken: (nodes at: 1).
	result test: (nodes at: 2).
	^ result