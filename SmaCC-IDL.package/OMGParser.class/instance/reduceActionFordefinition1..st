generated-reduction actions
reduceActionFordefinition1: nodes
	| result |
	result := ASTDefinitionNode new.
	result typeDcl: (nodes at: 1).
	result semicolonToken: (nodes at: 2).
	^ result