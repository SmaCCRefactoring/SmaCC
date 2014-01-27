generated
reduceActionFordeclaration_statement1: nodes
	| result |
	result := CSDeclarationStatementNode new.
	result declaration: (nodes at: 1).
	result semicolonToken: (nodes at: 2).
	^result