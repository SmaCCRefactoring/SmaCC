generated-reduction actions
reduceActionForthis_access1: nodes
	| result |
	result := CSThisAccessNode new.
	result thisToken: (nodes at: 1).
	^ result