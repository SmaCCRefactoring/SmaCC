generated-reduction actions
reduceActionFordefinition3: nodes
	| result |
	result := ASTDefinitionNode new.
	result exceptDcl: (nodes at: 1).
	result semicolonToken: (nodes at: 2).
	^ result