generated-reduction actions
reduceActionFordeclarators1: nodes
	| result |
	result := ASTDeclaratorsNode new.
	result declarator: (nodes at: 1).
	^ result