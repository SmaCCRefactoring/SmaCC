generated-reduction actions
reduceActionForcontinue_stmt1: nodes
	| result |
	result := ASTContinueNode new.
	result continueToken: (nodes at: 1).
	^ result