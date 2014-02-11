generated-reduction actions
reduceActionForinterface_declaration1: nodes
	| result |
	result := JavaInterfaceNode new.
	result addNodes: ((nodes at: 1) at: 1) to: result modifiers.
	result interfaceToken: (nodes at: 2).
	result _name: (nodes at: 3).
	result typeParameters: (nodes at: 4).
	result extendsToken: ((nodes at: 5) at: 1).
	result addNodes: ((nodes at: 5) at: 2) to: result interfaceTypes.
	result addTokens: ((nodes at: 5) at: 3) to: result commas.
	result left: ((nodes at: 6) at: 1).
	result addNodes: ((nodes at: 6) at: 2) to: result declarations.
	result right: ((nodes at: 6) at: 3).
	^ result