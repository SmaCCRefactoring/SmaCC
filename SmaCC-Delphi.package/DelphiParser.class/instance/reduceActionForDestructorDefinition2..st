generated-reduction actions
reduceActionForDestructorDefinition2: nodes
	| result |
	result := DelphiDestructorDefinitionNode new.
	result header: (nodes at: 1).
	^ result