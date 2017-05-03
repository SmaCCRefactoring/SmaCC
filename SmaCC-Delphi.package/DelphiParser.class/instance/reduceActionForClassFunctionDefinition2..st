generated-reduction actions
reduceActionForClassFunctionDefinition2: nodes
	| result |
	result := DelphiClassFunctionDefinitionNode new.
	result header: (nodes at: 1).
	^ result