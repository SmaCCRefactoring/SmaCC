generated-reduction actions
reduceActionForqualified_alias_member1: nodes
	| result |
	result := CSQualifiedAliasMemberNode new.
	result global: (nodes at: 1).
	result colonColonToken: (nodes at: 2).
	result name: (nodes at: 3).
	result typeArguments: (nodes at: 4).
	^ result