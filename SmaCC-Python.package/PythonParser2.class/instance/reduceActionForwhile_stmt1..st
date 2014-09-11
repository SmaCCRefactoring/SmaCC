generated-reduction actions
reduceActionForwhile_stmt1: nodes
	| result |
	result := PyWhileNode new.
	result whileToken: (nodes at: 1).
	result addToken: (nodes at: 3) to: result colonTokens.
	result suite: ((nodes at: 4) at: 1).
	result nEWLINEToken: ((nodes at: 4) at: 2).
	result iNDENTToken: ((nodes at: 4) at: 3).
	result dEDENTToken: ((nodes at: 4) at: 4).
	result addVariablesFrom: (nodes at: 5).
	^ result