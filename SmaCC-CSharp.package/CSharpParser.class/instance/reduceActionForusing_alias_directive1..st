generated-reduction actions
reduceActionForusing_alias_directive1: nodes
	| result |
	result := CSUsingAliasDirectiveNode new.
	result usingToken: (nodes at: 1).
	result _name: (nodes at: 2).
	result equalToken: (nodes at: 3).
	result namespace: (nodes at: 4).
	result semicolonToken: (nodes at: 5).
	^ result