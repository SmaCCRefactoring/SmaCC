generated-reduction actions
reduceActionForif_stmt1: nodes
	| result |
	result := PyIfNode new.
	result ifToken: (nodes at: 1).
	result if: (nodes at: 2).
	result colonToken: (nodes at: 3).
	result addNodes: ((nodes at: 4) at: 1) to: result statements.
	result nEWLINEToken: ((nodes at: 4) at: 2).
	result iNDENTToken: ((nodes at: 4) at: 3).
	result dEDENTToken: ((nodes at: 4) at: 4).
	result elsif: (nodes at: 5).
	result else: (nodes at: 6).
	^ result