generated-reduction actions
reduceActionForparameter_dcls1: nodes
	| result |
	result := ASTParameterDclsNode new.
	result leftParenToken: (nodes at: 1).
	result paramDcls: (nodes at: 2).
	result rightParenToken: (nodes at: 3).
	^ result