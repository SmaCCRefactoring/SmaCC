generated-reduction actions
reduceActionFormember_access3: nodes
	| result |
	result := CSMemberAccessNode new.
	result expression: (nodes at: 1).
	result periodToken: (nodes at: 2).
	result identifier: (nodes at: 3).
	^ result