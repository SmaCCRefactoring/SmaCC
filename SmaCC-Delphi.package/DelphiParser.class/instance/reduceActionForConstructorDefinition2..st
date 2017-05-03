generated-reduction actions
reduceActionForConstructorDefinition2: nodes
	| result |
	result := DelphiConstructorDefinitionNode new.
	result header: (nodes at: 1).
	^ result