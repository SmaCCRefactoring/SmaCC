generated-reduction actions
reduceActionForFunctionDefinition2: nodes
	| result |
	result := DelphiFunctionDefinitionNode new.
	result header: (nodes at: 1).
	^ result