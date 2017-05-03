generated-reduction actions
reduceActionForconst_type2: nodes
	| result |
	result := ASTConstTypeNode new.
	result charType: (nodes at: 1).
	^ result