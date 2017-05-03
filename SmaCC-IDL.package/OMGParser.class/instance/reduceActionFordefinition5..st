generated-reduction actions
reduceActionFordefinition5: nodes
	| result |
	result := ASTDefinitionNode new.
	result module: (nodes at: 1).
	result semicolonToken: (nodes at: 2).
	^ result