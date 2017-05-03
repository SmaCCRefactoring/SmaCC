generated-reduction actions
reduceActionForparam_dcls2: nodes
	| result |
	result := ASTParamDclsNode new.
	result paramDcls: (nodes at: 1).
	result commaToken: (nodes at: 2).
	result paramDcl: (nodes at: 3).
	^ result