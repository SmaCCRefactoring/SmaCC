generated-reduction actions
reduceActionFornull_conditional_operations3: nodes
	| result |
	result := CSNullConditionalMemberAccessNode new.
	result baseOperations: (nodes at: 1).
	result periodToken: (nodes at: 2).
	result identifierToken: (nodes at: 3).
	result typeArguments: (nodes at: 4).
	^ result