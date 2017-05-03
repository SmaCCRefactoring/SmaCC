generated-reduction actions
reduceActionForconst_exp1: nodes
	| result |
	result := ASTConstExpNode new.
	result orExpr: (nodes at: 1).
	^ result