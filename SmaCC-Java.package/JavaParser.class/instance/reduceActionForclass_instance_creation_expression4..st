generated-reduction actions
reduceActionForclass_instance_creation_expression4: nodes
	| result |
	result := JavaNewClassNode new.
	result primary: (nodes at: 1).
	result period: (nodes at: 2).
	result newToken: (nodes at: 3).
	result _name: (nodes at: 4).
	result addToken: (nodes at: 5) to: result lefts.
	result addNodes: ((nodes at: 6) at: 1) to: result expressions.
	result addTokens: ((nodes at: 6) at: 2) to: result commas.
	result addToken: (nodes at: 7) to: result rights.
	result addToken: ((nodes at: 8) at: 1) to: result lefts.
	result addNodes: ((nodes at: 8) at: 2) to: result declarations.
	result addToken: ((nodes at: 8) at: 3) to: result rights.
	^ result