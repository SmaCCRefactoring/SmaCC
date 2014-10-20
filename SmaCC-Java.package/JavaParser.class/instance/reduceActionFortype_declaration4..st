generated-reduction actions
reduceActionFortype_declaration4: nodes
	| result |
	result := JavaEmptyDeclarationNode new.
	result semicolon: (nodes at: 1).
	^ result