generated-reduction actions
reduceActionForindexer_declaration1: nodes
	| result |
	result := CSIndexerDeclarationNode new.
	result addNodes: (nodes at: 1) to: result _attributes.
	result addTokens: (nodes at: 2) to: result modifiers.
	result returnType: ((nodes at: 3) at: 1).
	result thisToken: ((nodes at: 3) at: 2).
	result leftBracketToken: ((nodes at: 3) at: 3).
	result addNodes: ((nodes at: 3) at: 4) to: result parameters.
	result addTokens: ((nodes at: 3) at: 5) to: result commas.
	result rightBracketToken: ((nodes at: 3) at: 6).
	result type: ((nodes at: 3) at: 7).
	result periodToken: ((nodes at: 3) at: 8).
	result leftBraceToken: ((nodes at: 4) at: 1).
	result getAccessor: ((nodes at: 4) at: 2).
	result setAccessor: ((nodes at: 4) at: 3).
	result rightBraceToken: ((nodes at: 4) at: 4).
	result equalGreaterThanToken: ((nodes at: 4) at: 5).
	result expression: ((nodes at: 4) at: 6).
	result semicolonToken: ((nodes at: 4) at: 7).
	^ result