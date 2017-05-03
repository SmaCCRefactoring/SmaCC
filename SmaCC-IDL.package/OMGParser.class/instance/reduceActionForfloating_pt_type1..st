generated-reduction actions
reduceActionForfloating_pt_type1: nodes
	| result |
	result := ASTFloatingPtTypeNode new.
	result floatToken: (nodes at: 1).
	^ result