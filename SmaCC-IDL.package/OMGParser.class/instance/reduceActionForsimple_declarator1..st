generated-reduction actions
reduceActionForsimple_declarator1: nodes
	| result |
	result := ASTSimpleDeclaratorNode new.
	result id: (nodes at: 1).
	^ result