generated
reduceActionForset_accessor_declaration1: nodes
	| result |
	result := CSSetAccessorDeclarationNode new.
	result addNodes: ((nodes at: 1) at: 1) to: result _attributes.
	result addTokens: ((nodes at: 2) at: 1) to: result modifiers.
	result setToken: (nodes at: 3).
	result body: ((nodes at: 4) at: 1).
	result semicolonToken: ((nodes at: 4) at: 2).
	^result