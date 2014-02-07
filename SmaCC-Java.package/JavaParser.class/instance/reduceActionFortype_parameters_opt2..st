generated
reduceActionFortype_parameters_opt2: nodes
	| result |
	result := JavaTypeParametersNode new.
	result left: (nodes at: 1).
	result addNodes: ((nodes at: 2) at: 1) to: result parameters.
	result addTokens: ((nodes at: 2) at: 2) to: result commas.
	result right: (nodes at: 3).
	^result