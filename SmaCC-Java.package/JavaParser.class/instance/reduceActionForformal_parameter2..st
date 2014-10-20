generated-reduction actions
reduceActionForformal_parameter2: nodes
	| result |
	result := JavaVariableArgumentParameterNode new.
	result addNodes: ((nodes at: 1) at: 1) to: result modifiers.
	result type: (nodes at: 2).
	result varArgsToken: (nodes at: 3).
	result variable: (nodes at: 4).
	^ result