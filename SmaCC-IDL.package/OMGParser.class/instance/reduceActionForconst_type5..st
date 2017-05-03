generated-reduction actions
reduceActionForconst_type5: nodes
	| result |
	result := ASTConstTypeNode new.
	result stringType: (nodes at: 1).
	^ result