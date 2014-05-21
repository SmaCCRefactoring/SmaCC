generated-reduction actions
reduceActionForraise_stmt2: nodes
	| result |
	result := ASTRaiseNode new.
	result raiseToken: (nodes at: 1).
	result arg1: (nodes at: 2).
	^ result