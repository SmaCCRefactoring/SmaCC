generated-reduction actions
reduceActionForpositive_int_const1: nodes
	| result |
	result := ASTPositiveIntConstNode new.
	result constExp: (nodes at: 1).
	^ result