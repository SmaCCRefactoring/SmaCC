generated-reduction actions
reduceActionForProcedureDefinition2: nodes
	| result |
	result := DelphiProcedureDefinitionNode new.
	result header: (nodes at: 1).
	^ result