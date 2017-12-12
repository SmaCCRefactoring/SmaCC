generated-reduction actions
reduceActionFortranslationUnit2: nodes
	| result |
	result := nodes at: 1.
	result addNode: (nodes at: 2) to: result declarations.
	^ result