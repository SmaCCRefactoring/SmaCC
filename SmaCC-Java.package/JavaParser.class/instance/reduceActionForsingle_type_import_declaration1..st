generated
reduceActionForsingle_type_import_declaration1: nodes
	| result |
	result := JavaSingleTypeImportDeclarationNode new.
	result importToken: (nodes at: 1).
	result staticToken: ((nodes at: 2) at: 1).
	result name: (nodes at: 3).
	result semicolon: (nodes at: 4).
	^result