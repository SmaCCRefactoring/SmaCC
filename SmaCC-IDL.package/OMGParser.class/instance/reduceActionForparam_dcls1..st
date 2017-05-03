generated-reduction actions
reduceActionForparam_dcls1: nodes
	| result |
	result := ASTParamDclsNode new.
	result paramDcl: (nodes at: 1).
	^ result