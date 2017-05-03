generated-reduction actions
reduceActionForstring_type2: nodes
	| result |
	result := ASTStringTypeNode new.
	result stringToken: (nodes at: 1).
	^ result