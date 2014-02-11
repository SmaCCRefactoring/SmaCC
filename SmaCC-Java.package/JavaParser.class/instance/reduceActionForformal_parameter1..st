generated-reduction actions
reduceActionForformal_parameter1: nodes
	| result |
	result := JavaParameterNode new.
	result addNodes: ((nodes at: 1) at: 1) to: result modifiers.
	result type: (nodes at: 2).
	result variable: (nodes at: 3).
	^ result