generated-reduction actions
reduceActionForclass_instance_creation_expression2: nodes
	| result |
	result := JavaNewClassNode new.
	result newToken: (nodes at: 1).
	result type: (nodes at: 2).
	result addToken: (nodes at: 3) to: result lefts.
	result addNodes: ((nodes at: 4) at: 1) to: result expressions.
	result addTokens: ((nodes at: 4) at: 2) to: result commas.
	result addToken: (nodes at: 5) to: result rights.
	result addToken: ((nodes at: 6) at: 1) to: result lefts.
	result addNodes: ((nodes at: 6) at: 2) to: result declarations.
	result addToken: ((nodes at: 6) at: 3) to: result rights.
	^ result