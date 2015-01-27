generated-reduction actions
reduceActionFortry_stmt2: nodes
	| result |
	result := PyTryNode new.
	result tryToken: (nodes at: 1).
	result addToken: (nodes at: 2) to: result colonTokens.
	result addNodes: ((nodes at: 3) at: 1) to: result statements.
	result addToken: ((nodes at: 3) at: 2) to: result nEWLINETokens.
	result addToken: ((nodes at: 3) at: 3) to: result iNDENTTokens.
	result addToken: ((nodes at: 3) at: 4) to: result dEDENTTokens.
	result finallyToken: (nodes at: 4).
	result addToken: (nodes at: 5) to: result colonTokens.
	result addNodes: ((nodes at: 6) at: 1) to: result statements.
	result addToken: ((nodes at: 6) at: 2) to: result nEWLINETokens.
	result addToken: ((nodes at: 6) at: 3) to: result iNDENTTokens.
	result addToken: ((nodes at: 6) at: 4) to: result dEDENTTokens.
	^ result