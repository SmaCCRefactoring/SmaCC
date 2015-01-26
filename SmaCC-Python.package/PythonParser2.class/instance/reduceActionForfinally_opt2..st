generated-reduction actions
reduceActionForfinally_opt2: nodes
	| result |
	result := PyFinallyNode new.
	result finallyToken: (nodes at: 1).
	result colonToken: (nodes at: 2).
	^ result