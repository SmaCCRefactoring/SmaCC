generated-reduction actions
reduceActionForscoped_name2: nodes
	| result |
	result := ASTScopedNameNode new.
	result colonColonToken: (nodes at: 1).
	result id: (nodes at: 2).
	^ result