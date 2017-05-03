generated-reduction actions
reduceActionFormember1: nodes
	| result |
	result := ASTMemberNode new.
	result typeSpec: (nodes at: 1).
	result declarators: (nodes at: 2).
	result semicolonToken: (nodes at: 3).
	^ result