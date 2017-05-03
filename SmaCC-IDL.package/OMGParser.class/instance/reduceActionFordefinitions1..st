generated-reduction actions
reduceActionFordefinitions1: nodes
	| result |
	result := ASTDefinitionsNode new.
	result definition: (nodes at: 1).
	^ result