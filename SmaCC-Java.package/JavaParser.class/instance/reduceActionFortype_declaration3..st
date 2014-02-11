generated-reduction actions
reduceActionFortype_declaration3: nodes
	| result |
	result := JavaEmptyDeclarationNode new.
	result semicolon: (nodes at: 1).
	^ result