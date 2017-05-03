generated-reduction actions
reduceActionFornull_conditional_operations1: nodes
	| result |
	result := CSNullConditionalMemberAccessNode new.
	result baseOperations: (nodes at: 1).
	result questionMarkToken: (nodes at: 2).
	result periodToken: (nodes at: 3).
	result identifierToken: (nodes at: 4).
	result typeArguments: (nodes at: 5).
	^ result