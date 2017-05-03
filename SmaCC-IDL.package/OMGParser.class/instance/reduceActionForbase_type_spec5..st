generated-reduction actions
reduceActionForbase_type_spec5: nodes
	| result |
	result := ASTBaseTypeSpecNode new.
	result octetType: (nodes at: 1).
	^ result