generated-reduction actions
reduceActionForscoped_names1: nodes
	| result |
	result := ASTScopedNamesNode new.
	result scopedName: (nodes at: 1).
	^ result