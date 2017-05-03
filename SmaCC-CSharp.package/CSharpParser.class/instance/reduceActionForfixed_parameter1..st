generated-reduction actions
reduceActionForfixed_parameter1: nodes
	| result |
	result := CSFixedParameterNode new.
	result addNodes: (nodes at: 1) to: result _attributes.
	result modifier: (nodes at: 2).
	result type: (nodes at: 3).
	result name: (nodes at: 4).
	result equalToken: ((nodes at: 5) at: 1).
	result expression: ((nodes at: 5) at: 2).
	^ result