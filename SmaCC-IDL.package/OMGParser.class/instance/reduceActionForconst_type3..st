generated-reduction actions
reduceActionForconst_type3: nodes
	| result |
	result := ASTConstTypeNode new.
	result booleanType: (nodes at: 1).
	^ result