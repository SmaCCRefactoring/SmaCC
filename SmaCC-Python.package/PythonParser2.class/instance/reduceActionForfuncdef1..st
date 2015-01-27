generated-reduction actions
reduceActionForfuncdef1: nodes
	| result |
	result := PyFuncdefNode new.
	result defToken: (nodes at: 1).
	result fname: (nodes at: 2).
	result parameters: (nodes at: 3).
	result colonToken: (nodes at: 4).
	result addNodes: ((nodes at: 5) at: 1) to: result statements.
	result nEWLINEToken: ((nodes at: 5) at: 2).
	result iNDENTToken: ((nodes at: 5) at: 3).
	result dEDENTToken: ((nodes at: 5) at: 4).
	^ result