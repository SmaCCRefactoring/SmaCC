generated-reduction actions
reduceActionForyield_expr1: nodes
	| result |
	result := ASTYieldNode new.
	result yieldToken: (nodes at: 1).
	result arguments: (nodes at: 2).
	^ result