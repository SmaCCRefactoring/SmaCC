generated-reduction actions
reduceActionForconstructor_declaration1: nodes
	| result |
	result := JavaConstructorDeclarationNode new.
	result addNodes: ((nodes at: 1) at: 1) to: result modifiers.
	result _name: ((nodes at: 2) at: 1).
	result left: ((nodes at: 2) at: 2).
	result addNodes: ((nodes at: 2) at: 3) to: result parameters.
	result addTokens: ((nodes at: 2) at: 4) to: result commas.
	result right: ((nodes at: 2) at: 5).
	result throws: (nodes at: 3).
	result body: (nodes at: 4).
	^ result