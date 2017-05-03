generated-reduction actions
reduceActionFornull_conditional_member_access1: nodes
	| result |
	result := CSNullConditionalMemberAccessNode new.
	result expression: (nodes at: 1).
	result baseOperations: (nodes at: 2).
	result questionMarkToken: (nodes at: 3).
	result periodToken: (nodes at: 4).
	result identifierToken: (nodes at: 5).
	result typeArguments: (nodes at: 6).
	^ result