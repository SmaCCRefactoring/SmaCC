generated-reduction actions
reduceActionFormethod_declaration1: nodes
	| result |
	result := CSMethodDeclarationNode new.
	result header: (nodes at: 1).
	result body: (nodes at: 2).
	^ result