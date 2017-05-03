generated-reduction actions
reduceActionForelement_spec1: nodes
	| result |
	result := ASTElementSpecNode new.
	result typeSpec: (nodes at: 1).
	result declarator: (nodes at: 2).
	^ result