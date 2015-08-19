generated-reduction actions
reduceActionForget_accessor_declaration1: nodes
	| result |
	result := CSGetAccessorDeclarationNode new.
	result addNodes: (nodes at: 1) to: result _attributes.
	result addTokens: (nodes at: 2) to: result modifiers.
	result getToken: (nodes at: 3).
	result body: ((nodes at: 4) at: 1).
	result semicolonToken: ((nodes at: 4) at: 2).
	^ result