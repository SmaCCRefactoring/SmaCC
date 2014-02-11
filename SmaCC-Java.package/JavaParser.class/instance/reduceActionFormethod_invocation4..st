generated-reduction actions
reduceActionFormethod_invocation4: nodes
	| result |
	result := JavaMethodInvocationNode new.
	result receiver: (nodes at: 1).
	result superPeriod: (nodes at: 2).
	result superToken: (nodes at: 3).
	result period: (nodes at: 4).
	result _name: (nodes at: 5).
	result addToken: (nodes at: 6) to: result lefts.
	result addNodes: ((nodes at: 7) at: 1) to: result expressions.
	result addTokens: ((nodes at: 7) at: 2) to: result commas.
	result addToken: (nodes at: 8) to: result rights.
	^ result