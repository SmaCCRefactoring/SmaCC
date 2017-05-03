generated-reduction actions
reduceActionForscoped_name1: nodes
	| result |
	result := ASTScopedNameNode new.
	result id: (nodes at: 1).
	^ result