generated-reduction actions
reduceActionForparameter_declaration3: nodes
	| result |
	result := CGLRParameterDeclarationNode new.
	result addObjects: (nodes at: 1) to: result specifiers.
	^ result