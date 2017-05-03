generated-reduction actions
reduceActionForspecification1: nodes
	| result |
	result := ASTSpecificationNode new.
	result definition: (nodes at: 1).
	^ result