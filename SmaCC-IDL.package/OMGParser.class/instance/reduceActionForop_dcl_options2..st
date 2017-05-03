generated-reduction actions
reduceActionForop_dcl_options2: nodes
	| result |
	result := ASTOpDclOptionsNode new.
	result raisesExpr: (nodes at: 1).
	^ result