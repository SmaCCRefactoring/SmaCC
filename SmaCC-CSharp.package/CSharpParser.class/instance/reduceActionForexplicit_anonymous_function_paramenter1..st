generated-reduction actions
reduceActionForexplicit_anonymous_function_paramenter1: nodes
	| result |
	result := CSAnonymousFunctionParameterNode new.
	result modifier: (nodes at: 1).
	result type: (nodes at: 2).
	result name: (nodes at: 3).
	^ result