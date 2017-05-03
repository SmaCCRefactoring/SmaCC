generated-reduction actions
reduceActionForop_dcl_options3: nodes
	| result |
	result := ASTOpDclOptionsNode new.
	result contextExpr: (nodes at: 1).
	^ result