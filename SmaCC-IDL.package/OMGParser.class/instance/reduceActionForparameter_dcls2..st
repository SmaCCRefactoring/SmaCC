generated-reduction actions
reduceActionForparameter_dcls2: nodes
	| result |
	result := ASTParameterDclsNode new.
	result leftParenToken: (nodes at: 1).
	result rightParenToken: (nodes at: 2).
	^ result