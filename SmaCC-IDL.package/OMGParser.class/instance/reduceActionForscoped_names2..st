generated-reduction actions
reduceActionForscoped_names2: nodes
	| result |
	result := ASTScopedNamesNode new.
	result scopedNames: (nodes at: 1).
	result commaToken: (nodes at: 2).
	result scopedName: (nodes at: 3).
	^ result