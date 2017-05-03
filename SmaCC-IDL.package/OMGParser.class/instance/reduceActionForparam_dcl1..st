generated-reduction actions
reduceActionForparam_dcl1: nodes
	| result |
	result := ASTParamDclNode new.
	result paramAttribute: (nodes at: 1).
	result paramTypeSpec: (nodes at: 2).
	result simpleDeclarator: (nodes at: 3).
	^ result