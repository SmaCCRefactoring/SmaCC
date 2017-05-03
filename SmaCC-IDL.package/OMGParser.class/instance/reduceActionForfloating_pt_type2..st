generated-reduction actions
reduceActionForfloating_pt_type2: nodes
	| result |
	result := ASTFloatingPtTypeNode new.
	result doubleToken: (nodes at: 1).
	^ result