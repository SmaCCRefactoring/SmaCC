generated-reduction actions
reduceActionForusing_namespace_directive1: nodes
	| result |
	result := CSUsingNamespaceDirectiveNode new.
	result usingToken: (nodes at: 1).
	result namespace: (nodes at: 2).
	result semicolonToken: (nodes at: 3).
	^ result