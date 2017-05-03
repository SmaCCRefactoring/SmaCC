generated-reduction actions
reduceActionFordeclarator2: nodes
	| result |
	result := ASTDeclaratorNode new.
	result complexDeclarator: (nodes at: 1).
	^ result