generated-reduction actions
reduceActionForextension_declaration1: nodes
	| result |
	result := SwiftExtensionDeclarationNode new.
	result extensionToken: (nodes at: 1).
	result colonToken: ((nodes at: 3) at: 1).
	result addTokens: ((nodes at: 3) at: 2) to: result identifierTokens.
	result addTokens: ((nodes at: 3) at: 3) to: result lessThanTokens.
	result addTokens: ((nodes at: 3) at: 4) to: result commaTokens.
	result addTokens: ((nodes at: 3) at: 5) to: result greaterThanTokens.
	result addTokens: ((nodes at: 3) at: 6) to: result periodTokens.
	result leftBraceToken: ((nodes at: 4) at: 1).
	result addNodes: ((nodes at: 4) at: 2) to: result declarations.
	result rightBraceToken: ((nodes at: 4) at: 3).
	^ result