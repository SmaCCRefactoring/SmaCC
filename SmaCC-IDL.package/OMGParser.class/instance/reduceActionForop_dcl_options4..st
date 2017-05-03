generated-reduction actions
reduceActionForop_dcl_options4: nodes
	| result |
	result := ASTOpDclOptionsNode new.
	result raisesExpr: (nodes at: 1).
	result contextExpr: (nodes at: 2).
	^ result