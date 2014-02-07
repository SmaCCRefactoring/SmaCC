generated
reduceActionFormethod_invocation3: nodes
	| result |
	result := JavaMethodInvocationNode new.
	result superToken: (nodes at: 1).
	result period: (nodes at: 2).
	result name: (nodes at: 3).
	result addToken: (nodes at: 4) to: result lefts.
	result addNodes: ((nodes at: 5) at: 1) to: result expressions.
	result addTokens: ((nodes at: 5) at: 2) to: result commas.
	result addToken: (nodes at: 6) to: result rights.
	^result