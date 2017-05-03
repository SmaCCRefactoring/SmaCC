generated-reduction actions
reduceActionForsimple_declarators1: nodes
	| result |
	result := ASTSimpleDeclaratorsNode new.
	result simpleDeclarator: (nodes at: 1).
	^ result