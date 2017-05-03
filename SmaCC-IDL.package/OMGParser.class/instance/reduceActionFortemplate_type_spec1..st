generated-reduction actions
reduceActionFortemplate_type_spec1: nodes
	| result |
	result := ASTTemplateTypeSpecNode new.
	result sequenceType: (nodes at: 1).
	^ result