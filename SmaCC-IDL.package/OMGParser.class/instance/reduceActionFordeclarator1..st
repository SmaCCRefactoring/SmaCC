generated-reduction actions
reduceActionFordeclarator1: nodes
	| result |
	result := ASTDeclaratorNode new.
	result simpleDeclarator: (nodes at: 1).
	^ result