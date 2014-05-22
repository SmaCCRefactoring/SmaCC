generated-reduction actions
reduceActionForcontinue_stmt1: nodes
	| result |
	result := PyContinueNode new.
	result continueToken: (nodes at: 1).
	^ result