generated-reduction actions
reduceActionForsimple_declarators2: nodes
	| result |
	result := ASTSimpleDeclaratorsNode new.
	result simpleDeclarators: (nodes at: 1).
	result commaToken: (nodes at: 2).
	result simpleDeclarator: (nodes at: 3).
	^ result