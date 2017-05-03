generated-reduction actions
reduceActionFornamed_entity2: nodes
	| result |
	result := CSNamedEntityNode new.
	result target: (nodes at: 1).
	result periodToken: (nodes at: 2).
	result identifierToken: (nodes at: 3).
	result typeArguments: (nodes at: 4).
	^ result