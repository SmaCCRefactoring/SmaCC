generated-reduction actions
reduceActionForconst_type4: nodes
	| result |
	result := ASTConstTypeNode new.
	result floatingPtType: (nodes at: 1).
	^ result