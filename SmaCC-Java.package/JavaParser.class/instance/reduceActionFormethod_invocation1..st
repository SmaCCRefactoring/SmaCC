generated
reduceActionFormethod_invocation1: nodes
	| result |
	result := JavaMethodInvocationNode new.
	result name: (nodes at: 1).
	result addToken: (nodes at: 2) to: result lefts.
	result addNodes: ((nodes at: 3) at: 1) to: result expressions.
	result addTokens: ((nodes at: 3) at: 2) to: result commas.
	result addToken: (nodes at: 4) to: result rights.
	^result