generated-reduction actions
reduceActionForparameter_declaration1: nodes
	| result |
	result := CGLRParameterDeclarationNode new.
	result addObjects: (nodes at: 1) to: result specifiers.
	result declarator: (nodes at: 2).
	^ result