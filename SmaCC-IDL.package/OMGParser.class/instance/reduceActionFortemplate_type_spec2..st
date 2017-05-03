generated-reduction actions
reduceActionFortemplate_type_spec2: nodes
	| result |
	result := ASTTemplateTypeSpecNode new.
	result stringType: (nodes at: 1).
	^ result