generated-reduction actions
reduceActionFormethod_invocation5: nodes
	| result |
	result := JavaMethodInvocationNode new.
	result receiver: (nodes at: 1).
	result superPeriod: (nodes at: 2).
	result superToken: (nodes at: 3).
	result period: (nodes at: 4).
	result typeArgLeft: ((nodes at: 5) at: 1).
	result addNodes: ((nodes at: 5) at: 2) to: result arguments.
	result addTokens: ((nodes at: 5) at: 3) to: result commas.
	result typeArgRight: ((nodes at: 5) at: 4).
	result _name: (nodes at: 6).
	result addToken: (nodes at: 7) to: result lefts.
	result addNodes: ((nodes at: 8) at: 1) to: result expressions.
	result addTokens: ((nodes at: 8) at: 2) to: result commas.
	result addToken: (nodes at: 9) to: result rights.
	^ result