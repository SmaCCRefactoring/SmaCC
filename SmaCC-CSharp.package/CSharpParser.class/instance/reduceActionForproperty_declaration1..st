generated-reduction actions
reduceActionForproperty_declaration1: nodes
	| result |
	result := CSPropertyDeclarationNode new.
	result addNodes: ((nodes at: 1) at: 1) to: result _attributes.
	result addTokens: ((nodes at: 2) at: 1) to: result modifiers.
	result type: (nodes at: 3).
	result _name: ((nodes at: 4) at: 1).
	result interface: ((nodes at: 4) at: 2).
	result periodToken: ((nodes at: 4) at: 3).
	result leftBraceToken: (nodes at: 5).
	result getAccessor: ((nodes at: 6) at: 1).
	result setAccessor: ((nodes at: 6) at: 2).
	result rightBraceToken: (nodes at: 7).
	^ result