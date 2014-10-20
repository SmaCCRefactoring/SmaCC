generated-reduction actions
reduceActionForuntyped_lambda_parameter1: nodes
	| result |
	result := JavaParameterNode new.
	result variable: (nodes at: 1).
	^ result