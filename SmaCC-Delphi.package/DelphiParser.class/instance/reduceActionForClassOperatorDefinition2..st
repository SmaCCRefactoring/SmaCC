generated-reduction actions
reduceActionForClassOperatorDefinition2: nodes
	| result |
	result := DelphiClassOperatorDefinitionNode new.
	result header: (nodes at: 1).
	^ result