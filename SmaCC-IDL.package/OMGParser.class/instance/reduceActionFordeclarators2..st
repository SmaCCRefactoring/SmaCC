generated-reduction actions
reduceActionFordeclarators2: nodes
	| result |
	result := ASTDeclaratorsNode new.
	result declarators: (nodes at: 1).
	result commaToken: (nodes at: 2).
	result declarator: (nodes at: 3).
	^ result