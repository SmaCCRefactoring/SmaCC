generated
reduceActionForlocal_variable_declaration_statement1: nodes
	| result |
	result := JavaLocalVariableDeclarationStatementNode new.
	result declaration: (nodes at: 1).
	result semicolon: (nodes at: 2).
	^result