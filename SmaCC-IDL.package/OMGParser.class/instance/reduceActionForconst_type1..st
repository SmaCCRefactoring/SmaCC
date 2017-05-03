generated-reduction actions
reduceActionForconst_type1: nodes
	| result |
	result := ASTConstTypeNode new.
	result integerType: (nodes at: 1).
	^ result