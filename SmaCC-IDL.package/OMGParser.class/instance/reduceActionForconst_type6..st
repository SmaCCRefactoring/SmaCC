generated-reduction actions
reduceActionForconst_type6: nodes
	| result |
	result := ASTConstTypeNode new.
	result scopedName: (nodes at: 1).
	^ result