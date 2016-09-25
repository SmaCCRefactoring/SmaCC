generated-reduction actions
reduceActionFormethod_invocation4: nodes
	| result |
	result := JavaMethodInvocationNode new.
	result superToken: (nodes at: 1).
	result period: (nodes at: 2).
	result typeArgLeft: ((nodes at: 3) at: 1).
	result addNodes: ((nodes at: 3) at: 2) to: result arguments.
	result addTokens: ((nodes at: 3) at: 3) to: result commas.
	result typeArgRight: ((nodes at: 3) at: 4).
	result name: (nodes at: 4).
	result addToken: (nodes at: 5) to: result lefts.
	result addNodes: ((nodes at: 6) at: 1) to: result expressions.
	result addTokens: ((nodes at: 6) at: 2) to: result commas.
	result addToken: (nodes at: 7) to: result rights.
	^ result