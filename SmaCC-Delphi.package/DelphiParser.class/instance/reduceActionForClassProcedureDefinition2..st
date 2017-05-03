generated-reduction actions
reduceActionForClassProcedureDefinition2: nodes
	| result |
	result := DelphiClassProcedureDefinitionNode new.
	result header: (nodes at: 1).
	^ result