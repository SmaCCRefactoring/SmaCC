generated-reduction actions
reduceActionForspecification2: nodes
	| result |
	result := ASTSpecificationNode new.
	result specification: (nodes at: 1).
	result definition: (nodes at: 2).
	^ result