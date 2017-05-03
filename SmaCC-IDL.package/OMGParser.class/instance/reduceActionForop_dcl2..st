generated-reduction actions
reduceActionForop_dcl2: nodes
	| result |
	result := ASTOpDclNode new.
	result opAttribute: (nodes at: 1).
	result opTypeSpec: (nodes at: 2).
	result id: (nodes at: 3).
	result parameterDcls: (nodes at: 4).
	result opDclOptions: (nodes at: 5).
	^ result