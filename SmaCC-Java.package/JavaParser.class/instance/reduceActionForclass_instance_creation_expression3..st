generated-reduction actions
reduceActionForclass_instance_creation_expression3: nodes
	| result |
	result := JavaNewNode new.
	result primary: (nodes at: 1).
	result period: (nodes at: 2).
	result newToken: (nodes at: 3).
	result name: (nodes at: 4).
	result addToken: (nodes at: 5) to: result lefts.
	result addNodes: ((nodes at: 6) at: 1) to: result expressions.
	result addTokens: ((nodes at: 6) at: 2) to: result commas.
	result addToken: (nodes at: 7) to: result rights.
	^ result