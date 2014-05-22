generated-reduction actions
reduceActionForfuncdef1: nodes
	| result |
	result := PyFuncdefNode new.
	result defToken: (nodes at: 1).
	result fname: (nodes at: 2).
	result parameters: (nodes at: 3).
	result colonToken: (nodes at: 4).
	result body: (nodes at: 5).
	^ result