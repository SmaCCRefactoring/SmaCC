generated
reduceActionFornamespace_declaration1: nodes
	| result |
	result := CSNamespaceDeclarationNode new.
	result namespaceToken: (nodes at: 1).
	result identifier: (nodes at: 2).
	result leftBraceToken: ((nodes at: 3) at: 1).
	result addNodes: ((nodes at: 3) at: 2) to: result directives.
	result addNodes: ((nodes at: 3) at: 3) to: result declarations.
	result rightBraceToken: ((nodes at: 3) at: 4).
	result semicolon: ((nodes at: 4) at: 1).
	^result