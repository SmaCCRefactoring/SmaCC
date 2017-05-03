generated-reduction actions
reduceActionForscoped_name3: nodes
	| result |
	result := ASTScopedNameNode new.
	result scopedName: (nodes at: 1).
	result colonColonToken: (nodes at: 2).
	result id: (nodes at: 3).
	^ result