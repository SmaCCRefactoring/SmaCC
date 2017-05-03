generated-reduction actions
reduceActionFordefinition2: nodes
	| result |
	result := ASTDefinitionNode new.
	result constDcl: (nodes at: 1).
	result semicolonToken: (nodes at: 2).
	^ result