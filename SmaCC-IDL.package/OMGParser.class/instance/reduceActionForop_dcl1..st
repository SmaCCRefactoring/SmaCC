generated-reduction actions
reduceActionForop_dcl1: nodes
	| result |
	result := ASTOpDclNode new.
	result opTypeSpec: (nodes at: 1).
	result id: (nodes at: 2).
	result parameterDcls: (nodes at: 3).
	result opDclOptions: (nodes at: 4).
	^ result