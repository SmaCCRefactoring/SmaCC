generated-reduction actions
reduceActionForfor_stmt1: nodes
	| result |
	result := PyForNode new.
	result forToken: (nodes at: 1).
	result addNodes: ((nodes at: 2) at: 1) to: result exprs.
	result addTokens: ((nodes at: 2) at: 2) to: result commaTokens.
	result inToken: (nodes at: 3).
	result addNodes: ((nodes at: 4) at: 1) to: result tests.
	result addTokens: ((nodes at: 4) at: 2) to: result commaTokens.
	result colonToken: (nodes at: 5).
	result addNodes: ((nodes at: 6) at: 1) to: result statements.
	result nEWLINEToken: ((nodes at: 6) at: 2).
	result iNDENTToken: ((nodes at: 6) at: 3).
	result dEDENTToken: ((nodes at: 6) at: 4).
	result else: (nodes at: 7).
	^ result