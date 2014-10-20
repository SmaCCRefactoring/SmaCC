generated-reduction actions
reduceActionFormethod_invocation1: nodes
	| result |
	result := JavaMethodInvocationNode new.
	result typeArgLeft: ((nodes at: 1) at: 1).
	result addNodes: ((nodes at: 1) at: 2) to: result arguments.
	result addTokens: ((nodes at: 1) at: 3) to: result commas.
	result typeArgRight: ((nodes at: 1) at: 4).
	result _name: (nodes at: 2).
	result left: (nodes at: 3).
	result addNodes: ((nodes at: 4) at: 1) to: result expressions.
	result addTokens: ((nodes at: 4) at: 2) to: result commas.
	result right: (nodes at: 5).
	^ result