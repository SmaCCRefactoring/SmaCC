generated-reduction actions
reduceActionFordefinition4: nodes
	| result |
	result := ASTDefinitionNode new.
	result interface: (nodes at: 1).
	result semicolonToken: (nodes at: 2).
	^ result