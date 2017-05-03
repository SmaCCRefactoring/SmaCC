generated-reduction actions
reduceActionForpredefined_type4: nodes
	| result |
	result := CSSimpleTypeNode new.
	result token: (nodes at: 1).
	^ result