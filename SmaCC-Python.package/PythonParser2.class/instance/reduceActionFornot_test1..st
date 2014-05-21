generated-reduction actions
reduceActionFornot_test1: nodes
	| result |
	result := ASTNotNode new.
	result notToken: (nodes at: 1).
	result negated: (nodes at: 2).
	^ result