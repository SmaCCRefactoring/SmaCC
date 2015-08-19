generated-reduction actions
reduceActionForparameter_array1: nodes
	| result |
	result := CSArrayParameterNode new.
	result addNodes: (nodes at: 1) to: result _attributes.
	result paramsToken: (nodes at: 2).
	result type: (nodes at: 3).
	result _name: (nodes at: 4).
	^ result