generated-reduction actions
reduceActionForfinally_opt2: nodes
	| result |
	result := PyFinallyNode new.
	result finallyToken: (nodes at: 1).
	result colonToken: (nodes at: 2).
	result addNodes: ((nodes at: 3) at: 1) to: result statements.
	result nEWLINEToken: ((nodes at: 3) at: 2).
	result iNDENTToken: ((nodes at: 3) at: 3).
	result dEDENTToken: ((nodes at: 3) at: 4).
	^ result