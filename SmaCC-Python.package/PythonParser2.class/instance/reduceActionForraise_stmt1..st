generated-reduction actions
reduceActionForraise_stmt1: nodes
	| result |
	result := ASTRaiseNode new.
	result raiseToken: (nodes at: 1).
	^ result