generated-reduction actions
reduceActionFordefinitions2: nodes
	| result |
	result := ASTDefinitionsNode new.
	result definitions: (nodes at: 1).
	result definition: (nodes at: 2).
	^ result