generated
reduceActionForinterface_indexer_declaration1: nodes
	| result |
	result := CSInterfaceIndexerDeclarationNode new.
	result addNodes: ((nodes at: 1) at: 1) to: result _attributes.
	result modifier: (nodes at: 2).
	result type: (nodes at: 3).
	result thisToken: (nodes at: 4).
	result leftBracket: (nodes at: 5).
	result addNodes: ((nodes at: 6) at: 1) to: result parameters.
	result addTokens: ((nodes at: 6) at: 2) to: result commas.
	result rightBracket: (nodes at: 7).
	result leftBrace: (nodes at: 8).
	result getAccessor: ((nodes at: 9) at: 1).
	result setAccessor: ((nodes at: 9) at: 2).
	result rightBrace: (nodes at: 10).
	^result